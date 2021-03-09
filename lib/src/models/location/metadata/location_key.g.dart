// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_key.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationKey _$LocationKeyFromJson(Map<String, dynamic> json) {
  return LocationKey(
    json['plusPageId'] as String?,
    json['placeId'] as String?,
    json['explicitNoPlaceId'] as bool?,
    json['requestId'] as String?,
  );
}

Map<String, dynamic> _$LocationKeyToJson(LocationKey instance) =>
    <String, dynamic>{
      'plusPageId': instance.plusPageId,
      'placeId': instance.placeId,
      'explicitNoPlaceId': instance.explicitNoPlaceId,
      'requestId': instance.requestId,
    };
