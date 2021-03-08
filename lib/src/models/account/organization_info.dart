import 'package:json_annotation/json_annotation.dart';

import '../location/postal_address.dart';

part 'organization_info.g.dart';

/// Additional information stored for an organization.
@JsonSerializable()
class OrganizationInfo {
  /// Output only. The registered domain for the account.
  final String registeredDomain;

  /// Output only. The postal address for the account.
  final PostalAddress address;

  /// Output only. The contact number for the organization.
  final String phoneNumber;

  OrganizationInfo(this.registeredDomain, this.address, this.phoneNumber);

  factory OrganizationInfo.fromJson(Map<String, dynamic> json) => _$OrganizationInfoFromJson(json);
  Map<String, dynamic> toJson() => _$OrganizationInfoToJson(this);
}