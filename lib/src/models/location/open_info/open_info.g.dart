// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'open_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OpenInfo _$OpenInfoFromJson(Map<String, dynamic> json) => OpenInfo(
      $enumDecode(_$OpenForBusinessEnumMap, json['status']),
      json['canReopen'] as bool?,
      json['openingDate'] == null
          ? null
          : Date.fromJson(json['openingDate'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OpenInfoToJson(OpenInfo instance) => <String, dynamic>{
      'status': _$OpenForBusinessEnumMap[instance.status],
      'canReopen': instance.canReopen,
      'openingDate': instance.openingDate,
    };

const _$OpenForBusinessEnumMap = {
  OpenForBusiness.OPEN_FOR_BUSINESS_UNSPECIFIED:
      'OPEN_FOR_BUSINESS_UNSPECIFIED',
  OpenForBusiness.OPEN: 'OPEN',
  OpenForBusiness.CLOSED_PERMANENTLY: 'CLOSED_PERMANENTLY',
  OpenForBusiness.CLOSED_TEMPORARILY: 'CLOSED_TEMPORARILY',
};
