/// Indicates the verification state of the account.
enum VerificationState {
  /// Not specified.
  VERIFICATION_STATE_UNSPECIFIED,

  /// Verified account.
  VERIFIED,

  /// Account that is not verified, and verification has not been requested.
  UNVERIFIED,

  /// Account that is not verified, but verification has been requested.
  VERIFICATION_REQUESTED
}
