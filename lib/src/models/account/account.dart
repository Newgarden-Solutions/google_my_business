import 'package:json_annotation/json_annotation.dart';

import 'account_role.dart';
import 'account_type.dart';
import 'organization_info.dart';
import 'permission_level.dart';
import 'verification_state.dart';
import 'vetted_state.dart';

part 'account.g.dart';

/// An account is a container for your location.
/// If you are the only user who manages locations for your business, you can use your personal Google Account.
/// To share management of locations with multiple users, create a business account at https://support.google.com/business/answer/6085339?ref_topic=6085325.
@JsonSerializable()
class Account {
  /// Immutable. The resource name, in the format `accounts/{account_id}`.
  final String name;

  /// Required. The name of the account.
  /// For an account of type PERSONAL, this is the first and last name of the user account.
  final String accountName;

  /// Required. Input only.
  /// The resource name of the account which will be the primary owner of the account being created.
  /// It should be of the form `accounts/{account_id}/`.
  final String primaryOwner;

  /// Required. Contains the type of account.
  /// Accounts of type PERSONAL and ORGANIZATION cannot be created using this API.
  final AccountType type;

  /// Output only. Specifies the AccountRole of this account.
  final AccountRole role;

  /// Output only. If verified, future locations that are created are automatically connected to Google Maps, and have Google+ pages created, without requiring moderation.
  final VerificationState verificationState;

  /// Output only. Indicates whether the account is vetted by Google.
  /// A vetted account is able to verify locations via the VETTED_PARTNER method.
  final VettedState vettedState;

  /// Output only. Account reference number if provisioned.
  final String accountNumber;

  /// Output only. Specifies the permission level the user has for this account.
  final PermissionLevel permissionLevel;

  /// Output only. Additional info for an organization.
  /// This is populated only for an organization account.
  final OrganizationInfo organizationInfo;

  Account(
      this.name,
      this.accountName,
      this.primaryOwner,
      this.type,
      this.role,
      this.verificationState,
      this.vettedState,
      this.accountNumber,
      this.permissionLevel,
      this.organizationInfo);

  factory Account.fromJson(Map<String, dynamic> json) => _$AccountFromJson(json);
  Map<String, dynamic> toJson() => _$AccountToJson(this);
}