import 'package:json_annotation/json_annotation.dart';

import 'review.dart';

part 'reviews.g.dart';

@JsonSerializable()
class Reviews {
  final List<Review>? reviews;
  final num? averageRating;
  final num? totalReviewCount;
  final String? nextPageToken;

  Reviews(this.reviews, this.averageRating, this.totalReviewCount,
      this.nextPageToken);

  factory Reviews.fromJson(Map<String, dynamic> json) =>
      _$ReviewsFromJson(json);
  Map<String, dynamic> toJson() => _$ReviewsToJson(this);
}
