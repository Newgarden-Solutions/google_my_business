import 'package:json_annotation/json_annotation.dart';

import '../common/latlng.dart';

part 'point_radius.g.dart';

/// A radius around a particular point (latitude/longitude).
@JsonSerializable()
class PointRadius {
  final LatLng? latlng;
  final num? radiusKm;

  PointRadius(this.latlng, this.radiusKm);

  factory PointRadius.fromJson(Map<String, dynamic> json) =>
      _$PointRadiusFromJson(json);
  Map<String, dynamic> toJson() => _$PointRadiusToJson(this);
}
