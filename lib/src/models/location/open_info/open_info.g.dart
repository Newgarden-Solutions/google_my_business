// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'open_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OpenInfo _$OpenInfoFromJson(Map<String, dynamic> json) {
  return OpenInfo(
    _$enumDecode(_$OpenForBusinessEnumMap, json['status']),
    json['canReopen'] as bool?,
    json['openingDate'] == null
        ? null
        : Date.fromJson(json['openingDate'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$OpenInfoToJson(OpenInfo instance) => <String, dynamic>{
      'status': _$OpenForBusinessEnumMap[instance.status],
      'canReopen': instance.canReopen,
      'openingDate': instance.openingDate,
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

const _$OpenForBusinessEnumMap = {
  OpenForBusiness.OPEN_FOR_BUSINESS_UNSPECIFIED:
      'OPEN_FOR_BUSINESS_UNSPECIFIED',
  OpenForBusiness.OPEN: 'OPEN',
  OpenForBusiness.CLOSED_PERMANENTLY: 'CLOSED_PERMANENTLY',
  OpenForBusiness.CLOSED_TEMPORARILY: 'CLOSED_TEMPORARILY',
};
