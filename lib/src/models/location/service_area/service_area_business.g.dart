// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_area_business.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceAreaBusiness _$ServiceAreaBusinessFromJson(Map<String, dynamic> json) {
  return ServiceAreaBusiness(
    _$enumDecodeNullable(_$BusinessTypeEnumMap, json['businessType']),
    json['radius'] == null
        ? null
        : PointRadius.fromJson(json['radius'] as Map<String, dynamic>),
    json['places'] == null
        ? null
        : Places.fromJson(json['places'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ServiceAreaBusinessToJson(
        ServiceAreaBusiness instance) =>
    <String, dynamic>{
      'businessType': _$BusinessTypeEnumMap[instance.businessType],
      'radius': instance.radius,
      'places': instance.places,
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

const _$BusinessTypeEnumMap = {
  BusinessType.BUSINESS_TYPE_UNSPECIFIED: 'BUSINESS_TYPE_UNSPECIFIED',
  BusinessType.CUSTOMER_LOCATION_ONLY: 'CUSTOMER_LOCATION_ONLY',
  BusinessType.CUSTOMER_AND_BUSINESS_LOCATION: 'CUSTOMER_AND_BUSINESS_LOCATION',
};
