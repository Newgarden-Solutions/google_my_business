import 'places.dart';
import 'point_radius.dart';
import 'business_type.dart';

/// Service area businesses provide their service at the customer's location (for example, a locksmith or plumber).
class ServiceAreaBusiness {
  /// Indicates the [BusinessType] of the service area business.
  final BusinessType? businessType;

  /// Output only. The area that this business serves centered around a point.
  final PointRadius? radius;

  /// The area that this business serves defined through a set of places.
  final Places? places;

  ServiceAreaBusiness(this.businessType, this.radius, this.places);

  ServiceAreaBusiness.fromJson(Map<String, dynamic> json)
      : businessType = json["businessType"] == null
            ? null
            : BusinessType.values.firstWhere((type) =>
                type.toString() == "BusinessType.${json["businessType"]}"),
        radius = json["radius"] == null
            ? null
            : PointRadius.fromJson(json["radius"]),
        places =
            json["places"] == null ? null : Places.fromJson(json["places"]);
}
