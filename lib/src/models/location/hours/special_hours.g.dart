// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'special_hours.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpecialHours _$SpecialHoursFromJson(Map<String, dynamic> json) {
  return SpecialHours(
    (json['specialHourPeriods'] as List<dynamic>?)
        ?.map((e) => SpecialHourPeriod.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$SpecialHoursToJson(SpecialHours instance) =>
    <String, dynamic>{
      'specialHourPeriods': instance.specialHourPeriods,
    };
