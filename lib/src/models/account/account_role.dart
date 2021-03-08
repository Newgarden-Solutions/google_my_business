/// Indicates the access level that the authenticated user has for this account.
/// For more information, see the help center article at https://support.google.com/business/answer/3403100
enum AccountRole {
  /// Not specified.
  ACCOUNT_ROLE_UNSPECIFIED,

  /// The user is the primary owner this account.
  PRIMARY_OWNER,

  /// The user owner of the account.
  OWNER,

  /// The user can manage this account.
  MANAGER,

  /// The user can manage a limited set of features for the account.
  SITE_MANAGER
}