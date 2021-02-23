/// Contains a set of booleans that reflect the [https://support.google.com/business/answer/3480862](state of a Location).
class LocationState {
  /// Output only. Indicates whether the place ID associated with this location has updates.
  final bool isGoogleUpdated;

  /// Output only. Indicates whether the location is a duplicate of another location.
  final bool isDuplicate;

  /// Output only. Indicates whether the location is suspended.
  /// Suspended locations are not visible to end users in Google products.
  /// If you believe this was a mistake, see the [https://support.google.com/business/answer/4569145](help center article).
  final bool isSuspended;

  /// Output only. Indicates whether the location can be updated.
  final bool canUpdate;

  /// Output only. Indicates whether the location can be deleted using the Google My Business API.
  final bool canDelete;

  /// Output only. Indicates whether the location is verified.
  final bool isVerified;

  /// Output only. Indicates whether the location requires reverification.
  final bool needsReverification;

  /// Output only. Indicates whether the review of the location is pending.
  final bool isPendingReview;

  /// Output only. Indicates whether the location is disabled.
  final bool isDisabled;

  /// Output only. Indicates whether the location is published.
  final bool isPublished;

  /// Output only. Indicates whether the location is disconnected from a place on Google Maps.
  final bool isDisconnected;

  /// Output only. Indicates whether [https://developers.google.com/my-business/reference/rest/v4/accounts.locations.localPosts](accounts.locations.localPosts) is disabled for this location.
  final bool isLocalPostApiDisabled;

  /// Output only. Indicates if the listing can modify a ServiceList.
  final bool canModifyServiceList;

  /// Output only. Indicates if the listing is eligible for food menu.
  final bool canHaveFoodMenus;

  /// Output only. Indicates whether any of this Location's properties are in the edit pending state.
  final bool hasPendingEdits;

  /// Output only. Indicates whether the location has pending verification requests.
  final bool hasPendingVerification;

  /// Output only. Indicates whether the location can operate on Health data.
  final bool canOperateHealthData;

  /// Output only. Indicates whether the location can operate on Lodging data.
  final bool canOperateLodgingData;

  LocationState(
      this.isGoogleUpdated,
      this.isDuplicate,
      this.isSuspended,
      this.canUpdate,
      this.canDelete,
      this.isVerified,
      this.needsReverification,
      this.isPendingReview,
      this.isDisabled,
      this.isPublished,
      this.isDisconnected,
      this.isLocalPostApiDisabled,
      this.canModifyServiceList,
      this.canHaveFoodMenus,
      this.hasPendingEdits,
      this.hasPendingVerification,
      this.canOperateHealthData,
      this.canOperateLodgingData);

  LocationState.fromJson(Map<String, dynamic> json)
      : isGoogleUpdated = json["isGoogleUpdated"],
        isDuplicate = json["isDuplicate"],
        isSuspended = json["isSuspended"],
        canUpdate = json["canUpdate"],
        canDelete = json["canDelete"],
        isVerified = json["isVerified"],
        needsReverification = json["needsReverification"],
        isPendingReview = json["isPendingReview"],
        isDisabled = json["isDisabled"],
        isPublished = json["isPublished"],
        isDisconnected = json["isDisconnected"],
        isLocalPostApiDisabled = json["isLocalPostApiDisabled"],
        canModifyServiceList = json["canModifyServiceList"],
        canHaveFoodMenus = json["canHaveFoodMenus"],
        hasPendingEdits = json["hasPendingEdits"],
        hasPendingVerification = json["hasPendingVerification"],
        canOperateHealthData = json["canOperateHealthData"],
        canOperateLodgingData = json["canOperateLodgingData"];
}
