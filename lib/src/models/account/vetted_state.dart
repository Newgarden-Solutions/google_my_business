/// Indicates the vetted state of an account.
enum VettedState {
  /// Not specified.
  VETTED_STATE_UNSPECIFIED,

  /// The account is not vetted by Google.
  NOT_VETTED,

  /// The account is vetted by Google and in a valid state.
  /// An account is automatically vetted if it has direct access to a vetted group account.
  VETTED,

  /// The account is vetted but in an invalid state.
  /// The account will behave like an unvetted account.
  INVALID
}
