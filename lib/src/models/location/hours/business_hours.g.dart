// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_hours.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BusinessHours _$BusinessHoursFromJson(Map<String, dynamic> json) {
  return BusinessHours(
    (json['periods'] as List<dynamic>?)
        ?.map((e) => TimePeriod.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$BusinessHoursToJson(BusinessHours instance) =>
    <String, dynamic>{
      'periods': instance.periods,
    };
