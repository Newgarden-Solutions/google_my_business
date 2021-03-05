// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return Category(
    json['displayName'] as String?,
    json['categoryId'] as String?,
    (json['serviceTypes'] as List<dynamic>?)
        ?.map((e) => ServiceType.fromJson(e as Map<String, dynamic>))
        .toList(),
    (json['moreHoursTypes'] as List<dynamic>?)
        ?.map((e) => MoreHoursType.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'displayName': instance.displayName,
      'categoryId': instance.categoryId,
      'serviceTypes': instance.serviceTypes,
      'moreHoursTypes': instance.moreHoursTypes,
    };
