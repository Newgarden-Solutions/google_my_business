import 'package:google_my_business/src/models/review/star_rating.dart';
import 'package:json_annotation/json_annotation.dart';

import 'review_reply.dart';
import 'reviewer.dart';

part 'review.g.dart';

/// Output only. Represents a review for a location.
@JsonSerializable()
class Review {
  /// The resource name.
  /// For Review it is of the form `accounts/{accountId}/locations/{locationId}/reviews/{reviewId}`
  final String? name;

  /// The encrypted unique identifier.
  final String? reviewId;

  /// The author of the review.
  final Reviewer? reviewer;

  /// The star rating of the review.
  final StarRating? starRating;

  /// The body of the review as plain text with markups.
  final String? comment;

  /// The timestamp for when the review was written.
  ///
  /// A timestamp in RFC3339 UTC "Zulu" format, with nanosecond resolution and up to nine fractional digits.
  /// Examples: `"2014-10-02T15:01:23Z"` and `"2014-10-02T15:01:23.045123456Z"`.
  final String? createTime;

  /// The timestamp for when the review was last modified.
  ///
  /// A timestamp in RFC3339 UTC "Zulu" format, with nanosecond resolution and up to nine fractional digits.
  /// Examples: `"2014-10-02T15:01:23Z"` and `"2014-10-02T15:01:23.045123456Z"`.
  final String? updateTime;

  /// The owner/manager of this location's reply to this review.
  final ReviewReply? reviewReply;

  Review(this.name, this.reviewId, this.reviewer, this.starRating, this.comment,
      this.createTime, this.updateTime, this.reviewReply);

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);
  Map<String, dynamic> toJson() => _$ReviewToJson(this);
}
