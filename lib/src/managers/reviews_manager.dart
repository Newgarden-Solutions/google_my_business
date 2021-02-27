import 'dart:convert' show json;

import 'package:flutter/foundation.dart';
import 'package:google_my_business/google_my_business.dart';
import 'package:http/http.dart' as http;

import '../common/util.dart';

class ReviewsManager {
  /// It is possible to retrieve up to 50 reviews in a single request
  static const int MAX_PAGE_SIZE = 50;

  /// Contains list of [Reviews] for buffering purposes during requests
  final List<Reviews> _reviewsBuffer = [];

  /// Contains the list of fetched [Reviews] for a given location
  final List<Review> reviews = [];

  /// Total review count for a given location
  int totalReviewCount = 0;
  num averageRating = 0;

  /// Google identifier for this location in the form: accounts/{accountId}/locations/{locationId}.
  /// More at [Location]
  final String name;

  ReviewsManager({this.name});

  Future<void> fetchReviews(
      Function(List<Review> reviews) onSuccess,
      Function(num progress, List<Review> reviews) onProgress,
      Function(http.Response response) onError,
      [http.Client httpClient,
      String nextPageToken,
      int pageSize = MAX_PAGE_SIZE]) async {
    final pageToken = nextPageToken == null ? "" : "pageToken=$nextPageToken";

    if (pageSize > MAX_PAGE_SIZE) {
      pageSize = MAX_PAGE_SIZE;
    }

    final http.Response response = await http.get(
      'https://mybusiness.googleapis.com/v4/$name/reviews?pageSize=$pageSize&$pageToken',
      headers: await GMBAPI.instance.currentUser().authHeaders,
    );

    if (response.statusCode != 200) {
      onError(response);

      return;
    }

    debugPrint(response.body);
    final Map<String, dynamic> data = json.decode(response.body);
    final reviews = data.isNullOrEmpty() ? null : Reviews.fromJson(data);

    // Failed to fetch reviews. Possibly not enough rights for a given location
    if (reviews == null) {
      onError(response);

      return;
    }

    _reviewsBuffer.add(reviews);

    var progress = _reviewsBuffer.length * pageSize / reviews.totalReviewCount;

    final List<Review> reviewsChunk = _reviewsBuffer
        .map((reviews) => reviews.reviews)
        .toList()
        .expand((reviews) => reviews)
        .toList();

    onProgress(progress, reviewsChunk);

    if (reviews.nextPageToken != null) {
      return fetchReviews(onSuccess, onProgress, onError, httpClient,
          reviews.nextPageToken, pageSize);
    }

    totalReviewCount = reviews.totalReviewCount;

    // Convert from list of [Reviews] object to a list of [Review] objects
    final reviewsList = _reviewsBuffer
        .map((reviews) => reviews.reviews)
        .toList()
        .expand((reviews) => reviews)
        .toList();

    this.reviews.addAll(reviewsList);

    onSuccess(this.reviews);

    _reviewsBuffer.clear();
  }
}
