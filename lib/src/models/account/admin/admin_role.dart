/// Indicates the access level that an admin has. For more information, see `https://support.google.com/business/answer/3403100`
enum AdminRole {
  /// Not specified.
  ADMIN_ROLE_UNSPECIFIED,

  /// The admin has owner-level access and is the primary owner. (Displays as 'Primary Owner' in UI).
  PRIMARY_OWNER,

  /// The admin has owner-level access. (Displays as 'Owner' in UI).
  OWNER,

  /// The admin has managerial access.
  MANAGER,

  /// The admin can manage social (Google+) pages. (Displays as 'Site Manager' in UI).
  /// This API doesn't allow creating an account admin with a SITE_MANAGER role.
  SITE_MANAGER
}
