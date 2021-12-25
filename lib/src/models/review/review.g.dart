// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Review _$ReviewFromJson(Map<String, dynamic> json) => Review(
      json['name'] as String?,
      json['reviewId'] as String?,
      json['reviewer'] == null
          ? null
          : Reviewer.fromJson(json['reviewer'] as Map<String, dynamic>),
      $enumDecodeNullable(_$StarRatingEnumMap, json['starRating']),
      json['comment'] as String?,
      json['createTime'] as String?,
      json['updateTime'] as String?,
      json['reviewReply'] == null
          ? null
          : ReviewReply.fromJson(json['reviewReply'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ReviewToJson(Review instance) => <String, dynamic>{
      'name': instance.name,
      'reviewId': instance.reviewId,
      'reviewer': instance.reviewer,
      'starRating': _$StarRatingEnumMap[instance.starRating],
      'comment': instance.comment,
      'createTime': instance.createTime,
      'updateTime': instance.updateTime,
      'reviewReply': instance.reviewReply,
    };

const _$StarRatingEnumMap = {
  StarRating.STAR_RATING_UNSPECIFIED: 'STAR_RATING_UNSPECIFIED',
  StarRating.ONE: 'ONE',
  StarRating.TWO: 'TWO',
  StarRating.THREE: 'THREE',
  StarRating.FOUR: 'FOUR',
  StarRating.FIVE: 'FIVE',
};
