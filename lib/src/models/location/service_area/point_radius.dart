import '../common/latlng.dart';

/// A radius around a particular point (latitude/longitude).
class PointRadius {
  final LatLng latLng;
  final num radiusKm;

  PointRadius(this.latLng, this.radiusKm);

  PointRadius.fromJson(Map<String, dynamic> json)
      : latLng = json["latlng"] == null ? null : LatLng.fromJson(json["latlng"]),
        radiusKm = json["radiusKm"];
}
