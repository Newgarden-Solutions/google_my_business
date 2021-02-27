import 'dart:convert' show json;

import 'package:http/http.dart' as http;

import '../gmb_api.dart';
import '../models/location/location.dart';

/// Responsible for retrieving and managing locations for the given account (id).
class LocationsManager {
  final String accountId;

  LocationsManager({this.accountId});

  /// Fetches location from GMB API
  ///
  /// @funParameter onError([http.Response] response) - error callback - called when error occurs during communication with GMB API
  /// @funParameter onSuccess([List]<[Location]> locations) - success callback - contains list of locations for the given account
  Future<void> fetchLocations(Function(List<Location> locations) onSuccess,
      Function(http.Response response) onError,
      [http.Client httpClient]) async {
    if (httpClient == null) httpClient = http.Client();

    final http.Response response = await httpClient.get(
      'https://mybusiness.googleapis.com/v4/accounts/$accountId/locations',
      headers: await GMBAPI.instance.currentUser().authHeaders,
    );

    if (response.statusCode != 200) {
      onError(response);
      return;
    }

    final Map<String, dynamic> data = json.decode(response.body);
    final List<Location> locations = data['locations'] == null
        ? null
        : (data["locations"] as List)
            .map((locationJson) => Location.fromJson(locationJson))
            .toList();

    onSuccess(locations);
  }
}
