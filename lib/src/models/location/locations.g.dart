// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'locations.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Locations _$LocationsFromJson(Map<String, dynamic> json) => Locations(
      (json['locations'] as List<dynamic>)
          .map((e) => Location.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['totalSize'] as int?,
      json['nextPageToken'] as String?,
    );

Map<String, dynamic> _$LocationsToJson(Locations instance) => <String, dynamic>{
      'locations': instance.locations,
      'nextPageToken': instance.nextPageToken,
      'totalSize': instance.totalSize,
    };
