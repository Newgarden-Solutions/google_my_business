import 'package:json_annotation/json_annotation.dart';

import 'places.dart';
import 'point_radius.dart';
import 'business_type.dart';

part 'service_area_business.g.dart';

/// Service area businesses provide their service at the customer's location (for example, a locksmith or plumber).
@JsonSerializable()
class ServiceAreaBusiness {
  /// Indicates the [BusinessType] of the service area business.
  final BusinessType? businessType;

  /// Output only. The area that this business serves centered around a point.
  final PointRadius? radius;

  /// The area that this business serves defined through a set of places.
  final Places? places;

  ServiceAreaBusiness(this.businessType, this.radius, this.places);

  factory ServiceAreaBusiness.fromJson(Map<String, dynamic> json) =>
      _$ServiceAreaBusinessFromJson(json);
  Map<String, dynamic> toJson() => _$ServiceAreaBusinessToJson(this);
}
