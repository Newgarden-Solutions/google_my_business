import 'reviewer.dart';
import 'review_reply.dart';

class Review {
  final String name;
  final String reviewId;
  final Reviewer reviewer;
  final String starRating;
  final String comment;
  final String createTime;
  final String updateTime;
  final ReviewReply reviewReply;

  Review(this.name, this.reviewId, this.reviewer, this.starRating, this.comment,
      this.createTime, this.updateTime, this.reviewReply);

  Review.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        reviewId = json['reviewId'],
        reviewer = json['reviewer'] == null
            ? null
            : Reviewer.fromJson(json['reviewer']),
        starRating = json['starRating'],
        comment = json['comment'],
        createTime = json['createTime'],
        updateTime = json['updateTime'],
        reviewReply = json['reviewReply'] == null
            ? null
            : ReviewReply.fromJson(json['reviewReply']);
}
