import 'dart:convert' show json;

import 'package:google_my_business/google_my_business.dart';
import 'package:google_my_business/src/models/error.dart';
import 'package:http/http.dart' as http;

import '../common/util.dart';

/// Responsible for retrieving and managing reviews for the given location (name).
class ReviewsManager {
  /// It is possible to retrieve up to 50 reviews in a single request
  static const int MAX_PAGE_SIZE = 50;

  /// Contains list of [Reviews] for buffering purposes during requests
  final List<Reviews> _reviewsBuffer = [];

  /// Contains the list of fetched [Review] for a given location
  final List<Review> reviews = [];

  /// Total review count for a given location
  int? totalReviewCount = 0;
  num? averageRating = 0;

  /// Google identifier for this location in the form: accounts/{accountId}/locations/{locationId}.
  /// More at [Location]
  final String? name;

  ReviewsManager({this.name});

  /// Fetches accounts from GMB API
  ///
  /// @funParameter onSuccess([List]<[Review]> locations) - success callback - contains list of reviews for the given location
  /// @funParameter onProgress([num] progress, [List]<[Review]> reviews) - progress callback - contains progress amount and preliminary reviews for that progress
  /// @funParameter onError([Error] error) - error callback - called when error occurs during communication with GMB API
  /// @funParameter httpClient - [http.Client] custom client if needed, otherwise `http.Client()` will be used
  /// @funParameter nextPageToken - token for the next page of reviews. If null - the first page of the reviews will be retrieved.
  /// @funParameter pageSize - amount of reviews to retrieve per one page. Maximum is [MAX_PAGE_SIZE].
  Future<void> fetchReviews(
      Function(List<Review> reviews) onSuccess,
      Function(num progress, List<Review> reviews) onProgress,
      Function(Error? error) onError,
      [http.Client? httpClient,
      String? nextPageToken,
      int pageSize = MAX_PAGE_SIZE]) async {
    if (httpClient == null) httpClient = http.Client();
    final pageToken = nextPageToken == null ? "" : "&pageToken=$nextPageToken";

    if (pageSize > MAX_PAGE_SIZE) {
      pageSize = MAX_PAGE_SIZE;
    }

    final http.Response response = await httpClient.get(
      Uri.parse(
          '${GoogleMyBusiness.BASE_URL}/$name/reviews?pageSize=$pageSize$pageToken'),
      headers: await GoogleMyBusiness.instance.currentUser()!.authHeaders,
    );

    if (response.statusCode != 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final Error? error =
          data['error'] == null ? null : Error.fromJson(data["error"]);
      onError(error);
      return;
    }

    final Map<String, dynamic>? data = json.decode(response.body);
    final reviews = data.isNullOrEmpty() ? null : Reviews.fromJson(data!);

    if (reviews == null) {
      onError(Error(
          401,
          'Failed to fetch reviews. Possibly not enough rights for a given location',
          'UNAUTHORIZED'));
      return;
    }

    _reviewsBuffer.add(reviews);

    var progress = _reviewsBuffer.length * pageSize / reviews.totalReviewCount!;

    final List<Review> reviewsChunk = _reviewsBuffer
        .map((reviews) => reviews.reviews)
        .toList()
        .expand((reviews) => reviews!)
        .toList();

    onProgress(progress, reviewsChunk);

    if (reviews.nextPageToken != null) {
      return fetchReviews(onSuccess, onProgress, onError, httpClient,
          reviews.nextPageToken, pageSize);
    }

    averageRating = reviews.averageRating;
    totalReviewCount = reviews.totalReviewCount as int?;

    // Convert from list of [Reviews] object to a list of [Review] objects
    final reviewsList = _reviewsBuffer
        .map((reviews) => reviews.reviews)
        .toList()
        .expand((reviews) => reviews!)
        .toList();

    this.reviews.addAll(reviewsList);

    onSuccess(this.reviews);

    _reviewsBuffer.clear();
  }
}
