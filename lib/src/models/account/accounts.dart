import 'package:json_annotation/json_annotation.dart';

import 'account.dart';

part 'accounts.g.dart';

/// Paginated list of accounts
/// https://mybusinessaccountmanagement.googleapis.com/v1/accounts
@JsonSerializable()
class Accounts {
  /// A collection of accounts to which the user has access.
  /// The personal account of the user doing the query will always be the first item of the result, unless it is filtered out.
  final List<Account> accounts;

  /// If the number of accounts exceeds the requested page size, this field is populated with a token to fetch the next page of accounts on a subsequent call to `accounts.list`.
  /// If there are no more accounts, this field is not present in the response.
  final String? nextPageToken;

  Accounts(this.accounts, this.nextPageToken);

  factory Accounts.fromJson(Map<String, dynamic> json) =>
      _$AccountsFromJson(json);
  Map<String, dynamic> toJson() => _$AccountsToJson(this);
}
