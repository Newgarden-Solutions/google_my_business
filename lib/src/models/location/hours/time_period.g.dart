// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_period.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimePeriod _$TimePeriodFromJson(Map<String, dynamic> json) {
  return TimePeriod(
    _$enumDecodeNullable(_$DayOfWeekEnumMap, json['openDay']),
    json['openTime'] as String?,
    _$enumDecodeNullable(_$DayOfWeekEnumMap, json['closeDay']),
    json['closeTime'] as String?,
  );
}

Map<String, dynamic> _$TimePeriodToJson(TimePeriod instance) =>
    <String, dynamic>{
      'openDay': _$DayOfWeekEnumMap[instance.openDay],
      'openTime': instance.openTime,
      'closeDay': _$DayOfWeekEnumMap[instance.closeDay],
      'closeTime': instance.closeTime,
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

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
