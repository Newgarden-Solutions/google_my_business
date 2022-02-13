// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'special_hour_period.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpecialHourPeriod _$SpecialHourPeriodFromJson(Map<String, dynamic> json) =>
    SpecialHourPeriod(
      Date.fromJson(json['startDate'] as Map<String, dynamic>),
      json['openTime'] as String?,
      Date.fromJson(json['endDate'] as Map<String, dynamic>),
      json['closeTime'] as String?,
      json['isClosed'] as bool?,
    );

Map<String, dynamic> _$SpecialHourPeriodToJson(SpecialHourPeriod instance) =>
    <String, dynamic>{
      'startDate': instance.startDate,
      'openTime': instance.openTime,
      'endDate': instance.endDate,
      'closeTime': instance.closeTime,
      'isClosed': instance.isClosed,
    };
