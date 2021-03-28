import 'package:json_annotation/json_annotation.dart';
import 'admin.dart';

part 'account_admins.g.dart';

/// Lists the admins for the specified account.
@JsonSerializable()
class AccountAdmins {
  /// A collection of Admin instances.
  final List<Admin> accountAdmins;

  AccountAdmins(this.accountAdmins);

  factory AccountAdmins.fromJson(Map<String, dynamic> json) =>
      _$AccountAdminsFromJson(json);
  Map<String, dynamic> toJson() => _$AccountAdminsToJson(this);
}