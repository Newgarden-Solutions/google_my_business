import 'package:json_annotation/json_annotation.dart';

import 'day_of_week.dart';

part 'time_period.g.dart';

/// Represents a span of time that the business is open, starting on the specified open day/time and closing on the specified close day/time.
/// The closing time must occur after the opening time, for example later in the same day, or on a subsequent day.
@JsonSerializable()
class TimePeriod {
  final DayOfWeek? openDay;
  final String? openTime;
  final DayOfWeek? closeDay;
  final String? closeTime;

  TimePeriod(this.openDay, this.openTime, this.closeDay, this.closeTime);

  factory TimePeriod.fromJson(Map<String, dynamic> json) =>
      _$TimePeriodFromJson(json);
  Map<String, dynamic> toJson() => _$TimePeriodToJson(this);
}
