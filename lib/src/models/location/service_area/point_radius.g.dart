// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'point_radius.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PointRadius _$PointRadiusFromJson(Map<String, dynamic> json) {
  return PointRadius(
    json['latLng'] == null
        ? null
        : LatLng.fromJson(json['latLng'] as Map<String, dynamic>),
    json['radiusKm'] as num?,
  );
}

Map<String, dynamic> _$PointRadiusToJson(PointRadius instance) =>
    <String, dynamic>{
      'latLng': instance.latLng,
      'radiusKm': instance.radiusKm,
    };
