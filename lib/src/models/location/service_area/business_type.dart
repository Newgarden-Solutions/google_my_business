/// Indicates whether this business only offers services onsite at a customer location (for example, a tow truck),
/// or at both an address and onsite (for example, a pizza store with a dining area, that also delivers to customers).
enum BusinessType {
  /// Output only. Not specified.
  BUSINESS_TYPE_UNSPECIFIED,

  /// Offers service only in the surrounding area (not at the business address).
  CUSTOMER_LOCATION_ONLY,

  /// Offers service at the business address and the surrounding area.
  CUSTOMER_AND_BUSINESS_LOCATION,
}
