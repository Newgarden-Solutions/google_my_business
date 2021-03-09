import 'package:json_annotation/json_annotation.dart';

part 'more_hours_type.g.dart';

/// More hours types that a business can offers, in addition to its regular hours.
@JsonSerializable()
class MoreHoursType {
  /// Output only. A stable ID provided by Google for this hours type.
  final String? hoursTypeId;

  /// Output only. The human-readable English display name for the hours type.
  final String? displayName;

  /// Output only. The human-readable localized display name for the hours type.
  final String? localizedDisplayName;

  MoreHoursType(this.hoursTypeId, this.displayName, this.localizedDisplayName);

  factory MoreHoursType.fromJson(Map<String, dynamic> json) =>
      _$MoreHoursTypeFromJson(json);
  Map<String, dynamic> toJson() => _$MoreHoursTypeToJson(this);
}
