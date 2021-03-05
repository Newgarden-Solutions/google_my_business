/// Defines an area that's represented by a place ID.
class PlaceInfo {
  /// The localized name of the place. For example, Scottsdale, AZ.
  final String? name;

  /// The ID of the place. Must correspond to a https://developers.google.com/places/web-service/supported_types.
  final String? placeId;

  PlaceInfo(this.name, this.placeId);

  PlaceInfo.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        placeId = json["placeId"];
}
