// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reviewer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Reviewer _$ReviewerFromJson(Map<String, dynamic> json) => Reviewer(
      json['profilePhotoUrl'] as String?,
      json['displayName'] as String?,
      json['isAnonymous'] as bool?,
    );

Map<String, dynamic> _$ReviewerToJson(Reviewer instance) => <String, dynamic>{
      'profilePhotoUrl': instance.profilePhotoUrl,
      'displayName': instance.displayName,
      'isAnonymous': instance.isAnonymous,
    };
