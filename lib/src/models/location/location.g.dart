// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      json['name'] as String?,
      json['languageCode'] as String?,
      json['storeCode'] as String?,
      json['locationName'] as String?,
      json['primaryPhone'] as String?,
      (json['additionalPhones'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      json['address'] == null
          ? null
          : PostalAddress.fromJson(json['address'] as Map<String, dynamic>),
      json['primaryCategory'] == null
          ? null
          : Category.fromJson(json['primaryCategory'] as Map<String, dynamic>),
      (json['additionalCategories'] as List<dynamic>?)
          ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['websiteUrl'] as String?,
      json['regularHours'] == null
          ? null
          : BusinessHours.fromJson(
              json['regularHours'] as Map<String, dynamic>),
      json['specialHours'] == null
          ? null
          : SpecialHours.fromJson(json['specialHours'] as Map<String, dynamic>),
      json['serviceArea'] == null
          ? null
          : ServiceAreaBusiness.fromJson(
              json['serviceArea'] as Map<String, dynamic>),
      json['locationKey'] == null
          ? null
          : LocationKey.fromJson(json['locationKey'] as Map<String, dynamic>),
      (json['labels'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['adWordsLocationExtensions'] == null
          ? null
          : AdWordsLocationExtensions.fromJson(
              json['adWordsLocationExtensions'] as Map<String, dynamic>),
      json['latlng'] == null
          ? null
          : LatLng.fromJson(json['latlng'] as Map<String, dynamic>),
      json['openInfo'] == null
          ? null
          : OpenInfo.fromJson(json['openInfo'] as Map<String, dynamic>),
      json['locationState'] == null
          ? null
          : LocationState.fromJson(
              json['locationState'] as Map<String, dynamic>),
      json['metadata'] == null
          ? null
          : Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
      (json['priceLists'] as List<dynamic>?)
          ?.map((e) => PriceList.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['profile'] == null
          ? null
          : Profile.fromJson(json['profile'] as Map<String, dynamic>),
      json['relationshipData'] == null
          ? null
          : RelationshipData.fromJson(
              json['relationshipData'] as Map<String, dynamic>),
      (json['moreHours'] as List<dynamic>?)
          ?.map((e) => MoreHours.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'name': instance.name,
      'languageCode': instance.languageCode,
      'storeCode': instance.storeCode,
      'locationName': instance.locationName,
      'primaryPhone': instance.primaryPhone,
      'additionalPhones': instance.additionalPhones,
      'address': instance.address,
      'primaryCategory': instance.primaryCategory,
      'additionalCategories': instance.additionalCategories,
      'websiteUrl': instance.websiteUrl,
      'regularHours': instance.regularHours,
      'specialHours': instance.specialHours,
      'serviceArea': instance.serviceArea,
      'locationKey': instance.locationKey,
      'labels': instance.labels,
      'adWordsLocationExtensions': instance.adWordsLocationExtensions,
      'latlng': instance.latlng,
      'openInfo': instance.openInfo,
      'locationState': instance.locationState,
      'metadata': instance.metadata,
      'priceLists': instance.priceLists,
      'profile': instance.profile,
      'relationshipData': instance.relationshipData,
      'moreHours': instance.moreHours,
    };
