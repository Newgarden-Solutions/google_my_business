/// More hours types that a business can offers, in addition to its regular hours.
class MoreHoursType {
  /// Output only. A stable ID provided by Google for this hours type.
  final String? hoursTypeId;

  /// Output only. The human-readable English display name for the hours type.
  final String? displayName;

  /// Output only. The human-readable localized display name for the hours type.
  final String? localizedDisplayName;

  MoreHoursType(this.hoursTypeId, this.displayName, this.localizedDisplayName);

  MoreHoursType.fromJson(Map<String, dynamic> json)
      : hoursTypeId = json["hoursTypeId"],
        displayName = json["displayName"],
        localizedDisplayName = json["localizedDisplayName"];
}
