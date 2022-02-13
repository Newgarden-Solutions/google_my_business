// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'places.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Places _$PlacesFromJson(Map<String, dynamic> json) => Places(
      (json['placeInfos'] as List<dynamic>?)
          ?.map((e) => PlaceInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PlacesToJson(Places instance) => <String, dynamic>{
      'placeInfos': instance.placeInfos,
    };
