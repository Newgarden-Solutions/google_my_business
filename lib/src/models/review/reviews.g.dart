// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reviews.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Reviews _$ReviewsFromJson(Map<String, dynamic> json) {
  return Reviews(
    (json['reviews'] as List<dynamic>?)
        ?.map((e) => Review.fromJson(e as Map<String, dynamic>))
        .toList(),
    json['averageRating'] as num?,
    json['totalReviewCount'] as num?,
    json['nextPageToken'] as String?,
  );
}

Map<String, dynamic> _$ReviewsToJson(Reviews instance) => <String, dynamic>{
      'reviews': instance.reviews,
      'averageRating': instance.averageRating,
      'totalReviewCount': instance.totalReviewCount,
      'nextPageToken': instance.nextPageToken,
    };
