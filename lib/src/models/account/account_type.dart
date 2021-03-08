/// Indicates what kind of account this is: either a personal/user account or a business account.
enum AccountType {
  /// Not specified.
  ACCOUNT_TYPE_UNSPECIFIED,
  /// An end-user account.
  PERSONAL,

  /// A group of Locations. For more information, see the help center article at https://support.google.com/business/answer/6085326
  LOCATION_GROUP,

  /// A User Group for segregating organization staff in groups. For more information, see the help center article at https://support.google.com/business/answer/7655731
  USER_GROUP,

  /// An organization representing a company. For more information, see the help center article at https://support.google.com/business/answer/7663063
  ORGANIZATION
}