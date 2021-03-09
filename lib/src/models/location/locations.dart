import 'package:json_annotation/json_annotation.dart';

import 'location.dart';

part 'locations.g.dart';

/// Paginated list of locations
/// https://developers.google.com/my-business/reference/rest/v4/accounts.locations/
@JsonSerializable()
class Locations {
  /// The locations.
  final List<Location> locations;

  /// If the number of locations exceeded the requested page size, this field is populated with a token to fetch the next page of locations on a subsequent call to `locations.list`.
  /// If there are no more locations, this field is not present in the response.
  final String? nextPageToken;

  /// The approximate number of Locations in the list irrespective of pagination.
  final int? totalSize;

  Locations(this.locations, this.totalSize, this.nextPageToken);

  factory Locations.fromJson(Map<String, dynamic> json) =>
      _$LocationsFromJson(json);
  Map<String, dynamic> toJson() => _$LocationsToJson(this);
}
