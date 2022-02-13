// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_period.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimePeriod _$TimePeriodFromJson(Map<String, dynamic> json) => TimePeriod(
      $enumDecodeNullable(_$DayOfWeekEnumMap, json['openDay']),
      json['openTime'] as String?,
      $enumDecodeNullable(_$DayOfWeekEnumMap, json['closeDay']),
      json['closeTime'] as String?,
    );

Map<String, dynamic> _$TimePeriodToJson(TimePeriod instance) =>
    <String, dynamic>{
      'openDay': _$DayOfWeekEnumMap[instance.openDay],
      'openTime': instance.openTime,
      'closeDay': _$DayOfWeekEnumMap[instance.closeDay],
      'closeTime': instance.closeTime,
    };

const _$DayOfWeekEnumMap = {
  DayOfWeek.DAY_OF_WEEK_UNSPECIFIED: 'DAY_OF_WEEK_UNSPECIFIED',
  DayOfWeek.MONDAY: 'MONDAY',
  DayOfWeek.TUESDAY: 'TUESDAY',
  DayOfWeek.WEDNESDAY: 'WEDNESDAY',
  DayOfWeek.THURSDAY: 'THURSDAY',
  DayOfWeek.FRIDAY: 'FRIDAY',
  DayOfWeek.SATURDAY: 'SATURDAY',
  DayOfWeek.SUNDAY: 'SUNDAY',
};
