import 'package:json_annotation/json_annotation.dart';

import 'special_hour_period.dart';

part 'special_hours.g.dart';

/// Represents a set of time periods when a location's operational hours differ from its normal business hours.
@JsonSerializable()
class SpecialHours {
  final List<SpecialHourPeriod>? specialHourPeriods;

  SpecialHours(this.specialHourPeriods);

  factory SpecialHours.fromJson(Map<String, dynamic> json) =>
      _$SpecialHoursFromJson(json);
  Map<String, dynamic> toJson() => _$SpecialHoursToJson(this);
}
