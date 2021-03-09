// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'postal_address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostalAddress _$PostalAddressFromJson(Map<String, dynamic> json) {
  return PostalAddress(
    json['languageCode'] as String?,
    json['locality'] as String?,
    json['regionCode'] as String?,
    json['postalCode'] as String?,
    json['administrativeArea'] as String?,
    json['sublocality'] as String?,
    (json['addressLines'] as List<dynamic>).map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$PostalAddressToJson(PostalAddress instance) =>
    <String, dynamic>{
      'languageCode': instance.languageCode,
      'locality': instance.locality,
      'regionCode': instance.regionCode,
      'postalCode': instance.postalCode,
      'administrativeArea': instance.administrativeArea,
      'sublocality': instance.sublocality,
      'addressLines': instance.addressLines,
    };
