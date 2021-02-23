/// Indicates the status of a location.
enum OpenForBusiness {
  /// Not specified.
  OPEN_FOR_BUSINESS_UNSPECIFIED,

  /// Indicates that the location is open.
  OPEN,

  /// Indicates that the location has been permanently closed.
  CLOSED_PERMANENTLY,

  /// Indicates that the location has been temporarily closed.
  /// This value may only be applied to published locations (i.e. locationState.is_published = true).
  /// When updating the status field to this value, clients are required to set the `updateMask` explicitly to `openInfo.status`.
  /// No other update masks can be set during this update call.
  /// This is a temporary restriction which will be relaxed soon.
  CLOSED_TEMPORARILY
}
