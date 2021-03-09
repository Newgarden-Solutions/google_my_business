import 'package:json_annotation/json_annotation.dart';

part 'service_type.g.dart';

/// A message describing a service type that the business offers
@JsonSerializable()
class ServiceType {
  final String? serviceTypeId;
  final String? displayName;

  ServiceType(this.serviceTypeId, this.displayName);

  factory ServiceType.fromJson(Map<String, dynamic> json) =>
      _$ServiceTypeFromJson(json);
  Map<String, dynamic> toJson() => _$ServiceTypeToJson(this);
}
