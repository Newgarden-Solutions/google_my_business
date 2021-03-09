// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'more_hours_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoreHoursType _$MoreHoursTypeFromJson(Map<String, dynamic> json) {
  return MoreHoursType(
    json['hoursTypeId'] as String?,
    json['displayName'] as String?,
    json['localizedDisplayName'] as String?,
  );
}

Map<String, dynamic> _$MoreHoursTypeToJson(MoreHoursType instance) =>
    <String, dynamic>{
      'hoursTypeId': instance.hoursTypeId,
      'displayName': instance.displayName,
      'localizedDisplayName': instance.localizedDisplayName,
    };
