// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'more_hours.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoreHours _$MoreHoursFromJson(Map<String, dynamic> json) => MoreHours(
      json['hoursTypeId'] as String?,
      (json['periods'] as List<dynamic>?)
          ?.map((e) => TimePeriod.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MoreHoursToJson(MoreHours instance) => <String, dynamic>{
      'hoursTypeId': instance.hoursTypeId,
      'periods': instance.periods,
    };
