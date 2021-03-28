import 'dart:convert' show json;

import 'package:google_my_business/src/models/account/admin/location_admins.dart';
import 'package:http/http.dart' as http;

import '../common/util.dart';
import '../google_my_business.dart';
import '../models/error.dart';
import '../models/location/location.dart';
import '../models/location/locations.dart';
import 'accounts_manager.dart';

/// Responsible for retrieving and managing locations for the given account (id).
class LocationsManager {
  final String? accountId;

  /// It is possible to retrieve up to 100 locations in a single request
  static const int MAX_PAGE_SIZE = 100;

  /// It is possible to retrieve at least 1 account in a single request
  static const int MIN_PAGE_SIZE = 1;

  /// Contains list of [Locations] for buffering purposes during requests
  final List<Locations> _locationsBuffer = [];

  /// Contains the list of fetched [Location] for a given location
  final List<Location> locations = [];

  LocationsManager({this.accountId});

  /// Fetches locations from GMB API
  ///
  /// @funParameter onSuccess([List]<[Location]> locations) - success callback - contains list of locations for the given account
  /// @funParameter onError([Error] error) - error callback - called when error occurs during communication with GMB API
  /// @funParameter httpClient - [http.Client] custom client if needed, otherwise `http.Client()` will be used
  Future<void> fetchLocations(Function(List<Location> locations) onSuccess,
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
      Uri.parse('${GoogleMyBusiness.BASE_URL}/accounts/$accountId/locations?pageSize=$pageSize$pageToken'),
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
    final locations = data.isNullOrEmpty() ? null : Locations.fromJson(data);

    if (locations == null) {
      onError(Error(401, 'Failed to fetch locations.', 'UNAUTHORIZED'));
      return;
    }

    _locationsBuffer.add(locations);

    if (locations.nextPageToken != null) {
      return fetchLocations(
          onSuccess, onError, httpClient, locations.nextPageToken, pageSize);
    }

    // Convert from list of [Locations] object to a list of [Location] objects
    final locationsList = _locationsBuffer
        .map((locations) => locations.locations)
        .toList()
        .expand((locations) => locations)
        .toList();

    this.locations.addAll(locationsList);

    onSuccess(this.locations);

    _locationsBuffer.clear();
  }

  /// Fetches admins from GMB API for the specified location
  ///
  /// @funParameter accountId - id of the account to get admins for
  /// @funParameter onSuccess([LocationAdmins] admins) - success callback - contains list of location admins for the given user
  /// @funParameter onError([Error] error) - error callback - called when error occurs during communication with GMB API
  /// @funParameter httpClient - [http.Client] custom client if needed, otherwise `http.Client()` will be used
  Future<void> fetchAdmins(
      String locationId,
      Function(LocationAdmins locationAdmins) onSuccess,
      Function(Error? error) onError,
      [http.Client? httpClient]) async {
    if (httpClient == null) httpClient = http.Client();

    final http.Response response = await httpClient.get(
      Uri.parse('${AccountsManager.BASE_URL}/locations/$locationId/admins'),
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
    final locationAdmins =
        data.isNullOrEmpty() ? null : LocationAdmins.fromJson(data);

    if (locationAdmins == null) {
      onError(Error(401, 'Failed to fetch account admins.', 'UNAUTHORIZED'));
      return;
    }

    onSuccess(locationAdmins);
  }
}
