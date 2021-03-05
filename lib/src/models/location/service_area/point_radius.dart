import 'package:json_annotation/json_annotation.dart';

import '../common/latlng.dart';

part 'point_radius.g.dart';

/// A radius around a particular point (latitude/longitude).
@JsonSerializable()
class PointRadius {
  final LatLng? latLng;
  final num? radiusKm;

  PointRadius(this.latLng, this.radiusKm);

  factory PointRadius.fromJson(Map<String, dynamic> json) =>
      _$PointRadiusFromJson(json);
  Map<String, dynamic> toJson() => _$PointRadiusToJson(this);
}
