import 'package:json_annotation/json_annotation.dart';

import 'time_period.dart';

part 'more_hours.g.dart';

/// The time periods during which a location is open for certain types of business.
@JsonSerializable()
class MoreHours {
  /// Required. Type of hours.
  /// Clients should call {#link businessCategories:BatchGet} to get supported hours types for categories of their locations.
  final String? hoursTypeId;

  /// Required. A collection of times that this location is open.
  /// Each period represents a range of hours when the location is open during the week.
  final List<TimePeriod>? periods;

  MoreHours(this.hoursTypeId, this.periods);

  factory MoreHours.fromJson(Map<String, dynamic> json) =>
      _$MoreHoursFromJson(json);
  Map<String, dynamic> toJson() => _$MoreHoursToJson(this);
}
