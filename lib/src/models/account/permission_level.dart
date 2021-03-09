/// Indicates the access level that the authenticated user has for this account.
enum PermissionLevel {
  /// Not specified.
  PERMISSION_LEVEL_UNSPECIFIED,

  /// The user has owner level permission.
  OWNER_LEVEL,

  /// The user has member level permission.
  MEMBER_LEVEL,
}
