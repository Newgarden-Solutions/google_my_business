import 'package:json_annotation/json_annotation.dart';
import 'admin.dart';

part 'location_admins.g.dart';

/// Lists all of the admins for the specified location.
@JsonSerializable()
class LocationAdmins {
  /// A collection of Admins.
  final List<Admin> admins;

  LocationAdmins(this.admins);

  factory LocationAdmins.fromJson(Map<String, dynamic> json) =>
      _$LocationAdminsFromJson(json);
  Map<String, dynamic> toJson() => _$LocationAdminsToJson(this);
}