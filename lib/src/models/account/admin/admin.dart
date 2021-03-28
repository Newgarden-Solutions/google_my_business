import 'package:json_annotation/json_annotation.dart';

import 'admin_role.dart';

part 'admin.g.dart';

/// An administrator of an Account or a location.
@JsonSerializable()
class Admin {
  /// Immutable. The resource name.
  /// For account admins, this is in the form: `accounts/{account_id}/admins/{admin_id}`
  /// For location admins, this is in the form: `locations/{locationId}/admins/{admin_id}`
  ///
  /// This field will be ignored if set during admin creation.
  final String name;

  /// Optional. The name of the admin.
  /// When making the initial invitation, this is the invitee's email address.
  /// On `GET` calls, the user's email address is returned if the invitation is still pending.
  /// Otherwise, it contains the user's first and last names.
  ///
  /// This field is only needed to be set during admin creation.
  final String admin;

  /// Required. Specifies the role that this admin uses with the specified Account or Location.
  final AdminRole role;

  /// Output only. Indicates whether this admin has a pending invitation for the specified resource.
  final bool pendingInvitation;

  Admin(this.name, this.admin, this.role, this.pendingInvitation);

  factory Admin.fromJson(Map<String, dynamic> json) =>
      _$AdminFromJson(json);
  Map<String, dynamic> toJson() => _$AdminToJson(this);
}