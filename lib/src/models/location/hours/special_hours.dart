import 'special_hour_period.dart';

/// Represents a set of time periods when a location's operational hours differ from its normal business hours.
class SpecialHours {
  final List<SpecialHourPeriod>? specialHourPeriods;

  SpecialHours(this.specialHourPeriods);

  SpecialHours.fromJson(Map<String, dynamic> json)
      : specialHourPeriods = json["specialHourPeriods"] == null
            ? null
            : (json["specialHourPeriods"] as List)
                .map((periodJson) => SpecialHourPeriod.fromJson(periodJson))
                .toList();
}
