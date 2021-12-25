// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organization_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrganizationInfo _$OrganizationInfoFromJson(Map<String, dynamic> json) =>
    OrganizationInfo(
      json['registeredDomain'] as String,
      PostalAddress.fromJson(json['address'] as Map<String, dynamic>),
      json['phoneNumber'] as String,
    );

Map<String, dynamic> _$OrganizationInfoToJson(OrganizationInfo instance) =>
    <String, dynamic>{
      'registeredDomain': instance.registeredDomain,
      'address': instance.address,
      'phoneNumber': instance.phoneNumber,
    };
