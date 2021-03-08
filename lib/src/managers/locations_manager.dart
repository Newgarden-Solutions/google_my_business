import 'dart:convert' show json;

import 'package:http/http.dart' as http;

import '../google_my_business.dart';
import '../models/error.dart';
import '../models/location/location.dart';

/// Responsible for retrieving and managing locations for the given account (id).
class LocationsManager {
  final String? accountId;

  LocationsManager({this.accountId});

  /// Fetches locations from GMB API
  ///
  /// @funParameter onSuccess([List]<[Location]> locations) - success callback - contains list of locations for the given account
  /// @funParameter onError([Error] error) - error callback - called when error occurs during communication with GMB API
  /// @funParameter httpClient - [http.Client] custom client if needed, otherwise `http.Client()` will be used
  Future<void> fetchLocations(Function(List<Location>? locations) onSuccess,
      Function(Error? error) onError,
      [http.Client? httpClient]) async {
    if (httpClient == null) httpClient = http.Client();

    final http.Response response = await httpClient.get(
      Uri.parse(
          'https://mybusiness.googleapis.com/v4/accounts/$accountId/locations'),
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
    final List<Location>? locations = data['locations'] == null
        ? null
        : (data["locations"] as List)
            .map((locationJson) => Location.fromJson(locationJson))
            .toList();

    onSuccess(locations);
  }
}
