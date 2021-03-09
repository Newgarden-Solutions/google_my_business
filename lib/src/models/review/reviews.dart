import 'package:json_annotation/json_annotation.dart';

import 'review.dart';

part 'reviews.g.dart';

/// Paginated list of reviews
/// https://developers.google.com/my-business/reference/rest/v4/accounts.locations.reviews/list
@JsonSerializable()
class Reviews {
  /// The reviews.
  final List<Review>? reviews;

  /// The average star rating of all reviews for this location on a scale of 1 to 5, where 5 is the highest rating.
  final num? averageRating;

  /// The total number of reviews for this location.
  final num? totalReviewCount;

  /// If the number of reviews exceeded the requested page size, this field is populated with a token to fetch the next page of reviews on a subsequent call to reviews.list.
  /// If there are no more reviews, this field is not present in the response.
  final String? nextPageToken;

  Reviews(this.reviews, this.averageRating, this.totalReviewCount,
      this.nextPageToken);

  factory Reviews.fromJson(Map<String, dynamic> json) =>
      _$ReviewsFromJson(json);
  Map<String, dynamic> toJson() => _$ReviewsToJson(this);
}
