// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_reply.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewReply _$ReviewReplyFromJson(Map<String, dynamic> json) {
  return ReviewReply(
    json['comment'] as String?,
    json['updateTime'] as String?,
  );
}

Map<String, dynamic> _$ReviewReplyToJson(ReviewReply instance) =>
    <String, dynamic>{
      'comment': instance.comment,
      'updateTime': instance.updateTime,
    };
