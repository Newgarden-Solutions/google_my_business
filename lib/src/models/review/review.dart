import 'package:google_my_business/src/models/review/star_rating.dart';
import 'package:json_annotation/json_annotation.dart';

import 'review_reply.dart';
import 'reviewer.dart';

part 'review.g.dart';

@JsonSerializable()
class Review {
  final String? name;
  final String? reviewId;
  final Reviewer? reviewer;
  final StarRating? starRating;
  final String? comment;
  final String? createTime;
  final String? updateTime;
  final ReviewReply? reviewReply;

  Review(this.name, this.reviewId, this.reviewer, this.starRating, this.comment,
      this.createTime, this.updateTime, this.reviewReply);

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);
  Map<String, dynamic> toJson() => _$ReviewToJson(this);
}
