// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'section.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Section _$SectionFromJson(Map<String, dynamic> json) => Section(
      json['sectionId'] as String?,
      (json['labels'] as List<dynamic>?)
          ?.map((e) => Label.fromJson(e as Map<String, dynamic>))
          .toList(),
      $enumDecodeNullable(_$SectionTypeEnumMap, json['sectionType']),
      (json['items'] as List<dynamic>?)
          ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SectionToJson(Section instance) => <String, dynamic>{
      'sectionId': instance.sectionId,
      'labels': instance.labels,
      'sectionType': _$SectionTypeEnumMap[instance.sectionType],
      'items': instance.items,
    };

const _$SectionTypeEnumMap = {
  SectionType.SECTION_TYPE_UNSPECIFIED: 'SECTION_TYPE_UNSPECIFIED',
  SectionType.FOOD: 'FOOD',
  SectionType.SERVICES: 'SERVICES',
};
