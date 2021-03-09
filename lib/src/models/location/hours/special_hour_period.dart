import 'package:json_annotation/json_annotation.dart';

import '../common/date.dart';

part 'special_hour_period.g.dart';

/// Represents a single time period when a location's operational hours differ from its normal business hours.
/// A special hour period must represent a range of less than 24 hours.
/// The `openTime` and `startDate` must predate the `closeTime` and `endDate`.
/// The `closeTime` and `endDate` can extend to 11:59 a.m. on the day after the specified startDate.
///
/// For example, the following inputs are valid:
///
/// ```
/// startDate=2015-11-23, openTime=08:00, closeTime=18:00
/// startDate=2015-11-23, endDate=2015-11-23, openTime=08:00,
/// closeTime=18:00 startDate=2015-11-23, endDate=2015-11-24,
/// openTime=13:00, closeTime=11:59
/// ```
///
/// ```
/// startDate=2015-11-23, openTime=13:00, closeTime=11:59
/// startDate=2015-11-23, endDate=2015-11-24, openTime=13:00,
/// closeTime=12:00 startDate=2015-11-23, endDate=2015-11-25,
/// openTime=08:00, closeTime=18:00
/// ```
@JsonSerializable()
class SpecialHourPeriod {
  /// The calendar date this special hour period starts on.
  final Date startDate;

  /// The wall time on `startDate` when a location opens, expressed in 24hr ISO 8601 extended format.
  /// (hh:mm) Valid values are 00:00-24:00, where 24:00 represents midnight at the end of the specified day field.
  /// Must be specified if `isClosed` is false.
  final String? openTime;

  /// The calendar date this special hour period ends on.
  /// If `endDate` field is not set, default to the date specified in `startDate`.
  /// If set, this field must be equal to or at most 1 day after `startDate`.
  final Date endDate;

  /// The wall time on `endDate` when a location closes, expressed in 24hr ISO 8601 extended format.
  /// (hh:mm) Valid values are 00:00-24:00, where 24:00 represents midnight at the end of the specified day field.
  /// Must be specified if `isClosed` is false.
  final String? closeTime;

  /// If true, `endDate`, `openTime`, and `closeTime` are ignored, and the date specified in `startDate` is treated as the location being closed for the entire day.
  final bool? isClosed;

  SpecialHourPeriod(this.startDate, this.openTime, this.endDate, this.closeTime,
      this.isClosed);

  factory SpecialHourPeriod.fromJson(Map<String, dynamic> json) =>
      _$SpecialHourPeriodFromJson(json);
  Map<String, dynamic> toJson() => _$SpecialHourPeriodToJson(this);
}
