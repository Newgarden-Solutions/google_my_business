import 'place_info.dart';

/// Defines the union of areas represented by a set of places.
class Places {
  /// The areas represented by place IDs. Limited to a maximum of 20 places.
  final List<PlaceInfo>? placeInfos;

  Places(this.placeInfos);

  Places.fromJson(Map<String, dynamic> json)
      : placeInfos = json["placeInfos"] == null
            ? null
            : (json["placeInfos"] as List)
                .map((placeInfoJson) => PlaceInfo.fromJson(placeInfoJson))
                .toList();
}
