// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_area_business.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceAreaBusiness _$ServiceAreaBusinessFromJson(Map<String, dynamic> json) =>
    ServiceAreaBusiness(
      $enumDecodeNullable(_$BusinessTypeEnumMap, json['businessType']),
      json['radius'] == null
          ? null
          : PointRadius.fromJson(json['radius'] as Map<String, dynamic>),
      json['places'] == null
          ? null
          : Places.fromJson(json['places'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ServiceAreaBusinessToJson(
        ServiceAreaBusiness instance) =>
    <String, dynamic>{
      'businessType': _$BusinessTypeEnumMap[instance.businessType],
      'radius': instance.radius,
      'places': instance.places,
    };

const _$BusinessTypeEnumMap = {
  BusinessType.BUSINESS_TYPE_UNSPECIFIED: 'BUSINESS_TYPE_UNSPECIFIED',
  BusinessType.CUSTOMER_LOCATION_ONLY: 'CUSTOMER_LOCATION_ONLY',
  BusinessType.CUSTOMER_AND_BUSINESS_LOCATION: 'CUSTOMER_AND_BUSINESS_LOCATION',
};
