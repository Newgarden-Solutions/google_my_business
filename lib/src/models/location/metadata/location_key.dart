/// Alternate/surrogate key references for a location.
class LocationKey {
  /// Output only. If this location has a Google+ page associated with it, this is populated with the Google+ page ID for this location.
  final String plusPageId;

  /// If this location has been verified and is connected to/appears on Google Maps, this field is populated with the place ID for the location. This ID can be used in various Places APIs.
  ///
  /// If this location is unverified, this field may be populated if the location has been associated with a place that appears on Google Maps.
  ///
  /// This field can be set during Create calls, but not for Update.
  ///
  /// The additional `explicitNoPlaceId` bool qualifies whether an unset place ID is deliberate or not.
  final String placeId;

  /// Output only. A value of true indicates that an unset place ID is deliberate, which is different from no association being made yet.
  final bool explicitNoPlaceId;

  /// Output only. The `requestId` used to create this location.
  /// May be empty if this location was created outside of the GMB API or Google My Business Locations.
  final String requestId;

  LocationKey(
      this.plusPageId, this.placeId, this.explicitNoPlaceId, this.requestId);

  LocationKey.fromJson(Map<String, dynamic> json)
      : plusPageId = json["plusPageId"],
        placeId = json["placeId"],
        explicitNoPlaceId = json["explicitNoPlaceId"],
        requestId = json["requestId"];
}
