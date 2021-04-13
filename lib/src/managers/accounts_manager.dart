import 'dart:convert' show json;

import 'package:google_my_business/src/models/account/admin/account_admins.dart';
import 'package:http/http.dart' as http;

import '../common/util.dart';
import '../google_my_business.dart';
import '../models/account/account.dart';
import '../models/account/accounts.dart';
import '../models/common/error/error.dart';

/// Responsible for retrieving and managing accounts for the given user.
class AccountsManager {
  /// Basic URL for accounts endpoint
  static const String BASE_URL = "${Constants.BASE_URL}/accounts";

  /// It is possible to retrieve up to 20 accounts in a single request
  static const int MAX_PAGE_SIZE = 20;

  /// It is possible to retrieve at least 2 accounts in a single request
  static const int MIN_PAGE_SIZE = 2;

  /// Contains list of [Accounts] for buffering purposes during requests
  final List<Accounts> _accountsBuffer = [];

  /// Contains the list of fetched [Account] for a given location
  final List<Account> accounts = [];

  /// Fetches accounts from GMB API
  ///
  /// @funParameter onSuccess([List]<[Account]> accounts) - success callback - contains list of accounts for the given user
  /// @funParameter onError([Error] error) - error callback - called when error occurs during communication with GMB API
  /// @funParameter httpClient - [http.Client] custom client if needed, otherwise `http.Client()` will be used
  /// @funParameter nextPageToken - token for the next page of accounts. If null - the first page of the accounts will be retrieved.
  /// @funParameter pageSize - amount of accounts to retrieve per one page. Maximum is [MAX_PAGE_SIZE], minimum is [MIN_PAGE_SIZE].
  Future<void> fetchAccounts(Function(List<Account> accounts) onSuccess,
      Function(Error? error) onError,
      [http.Client? httpClient,
      String? nextPageToken,
      int pageSize = MAX_PAGE_SIZE]) async {
    if (httpClient == null) httpClient = http.Client();
    final pageToken = nextPageToken == null ? "" : "&pageToken=$nextPageToken";

    if (pageSize < MIN_PAGE_SIZE) {
      pageSize = MIN_PAGE_SIZE;
    }

    if (pageSize > MAX_PAGE_SIZE) {
      pageSize = MAX_PAGE_SIZE;
    }

    final http.Response response = await httpClient.get(
      Uri.parse('$BASE_URL?pageSize=$pageSize$pageToken'),
      headers: await GoogleMyBusiness.instance.currentUser()!.authHeaders,
    );

    if (response.statusCode != 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final Error? error =
          data['error'] == null ? null : Error.fromJson(data["error"]);
      onError(error);
      return;
    }

    final Map<String, dynamic> data = json.decode(response.body);
    final accounts = data.isNullOrEmpty() ? null : Accounts.fromJson(data);

    if (accounts == null) {
      onError(Error(401, 'Failed to fetch accounts.', 'UNAUTHORIZED'));
      return;
    }

    _accountsBuffer.add(accounts);

    if (accounts.nextPageToken != null) {
      return fetchAccounts(
          onSuccess, onError, httpClient, accounts.nextPageToken, pageSize);
    }

    // Convert from list of [Accounts] object to a list of [Account] objects
    final accountsList = _accountsBuffer
        .map((accounts) => accounts.accounts)
        .toList()
        .expand((accounts) => accounts)
        .toList();

    this.accounts.addAll(accountsList);

    onSuccess(this.accounts);

    _accountsBuffer.clear();
  }

  /// Fetches admins from GMB API for the specified account
  ///
  /// @funParameter accountId - id of the account to get admins for
  /// @funParameter onSuccess([AccountAdmins] admins) - success callback - contains list of account admins for the given user
  /// @funParameter onError([Error] error) - error callback - called when error occurs during communication with GMB API
  /// @funParameter httpClient - [http.Client] custom client if needed, otherwise `http.Client()` will be used
  Future<void> fetchAdmins(
      String accountId,
      Function(AccountAdmins accountAdmins) onSuccess,
      Function(Error? error) onError,
      [http.Client? httpClient]) async {
    if (httpClient == null) httpClient = http.Client();

    final http.Response response = await httpClient.get(
      Uri.parse('$BASE_URL/$accountId/admins'),
      headers: await GoogleMyBusiness.instance.currentUser()!.authHeaders,
    );

    if (response.statusCode != 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final Error? error =
          data['error'] == null ? null : Error.fromJson(data["error"]);
      onError(error);
      return;
    }

    final Map<String, dynamic> data = json.decode(response.body);
    final accountAdmins =
        data.isNullOrEmpty() ? null : AccountAdmins.fromJson(data);

    if (accountAdmins == null) {
      onError(Error(401, 'Failed to fetch account admins.', 'UNAUTHORIZED'));
      return;
    }

    onSuccess(accountAdmins);
  }
}
