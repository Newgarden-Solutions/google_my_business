import 'review.dart';

class Reviews {
  final List<Review> reviews;
  final num averageRating;
  final num totalReviewCount;
  final String nextPageToken;

  Reviews(this.reviews, this.averageRating, this.totalReviewCount,
      this.nextPageToken);

  Reviews.fromJson(Map<String, dynamic> json)
      : reviews = json['reviews'] == null
            ? null
            : (json['reviews'] as List)
                .map((reviewJson) => Review.fromJson(reviewJson))
                .toList(),
        averageRating = json['averageRating'],
        totalReviewCount = json['totalReviewCount'],
        nextPageToken = json['nextPageToken'];
}
