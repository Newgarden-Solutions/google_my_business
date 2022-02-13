// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'point_radius.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PointRadius _$PointRadiusFromJson(Map<String, dynamic> json) => PointRadius(
      json['latlng'] == null
          ? null
          : LatLng.fromJson(json['latlng'] as Map<String, dynamic>),
      json['radiusKm'] as num?,
    );

Map<String, dynamic> _$PointRadiusToJson(PointRadius instance) =>
    <String, dynamic>{
      'latlng': instance.latlng,
      'radiusKm': instance.radiusKm,
    };
