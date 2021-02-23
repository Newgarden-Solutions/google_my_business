import 'day_of_week.dart';

/// Represents a span of time that the business is open, starting on the specified open day/time and closing on the specified close day/time.
/// The closing time must occur after the opening time, for example later in the same day, or on a subsequent day.
class TimePeriod {
  final DayOfWeek openDay;
  final String openTime;
  final DayOfWeek closeDay;
  final String closeTime;

  TimePeriod(this.openDay, this.openTime, this.closeDay, this.closeTime);

  TimePeriod.fromJson(Map<String, dynamic> json)
      : openDay = json["openDay"] == null
            ? null
            : DayOfWeek.values.firstWhere(
                (type) => type.toString() == "DayOfWeek.${json["openDay"]}"),
        openTime = json["openTime"],
        closeDay = json["closeDay"] == null
            ? null
            : DayOfWeek.values.firstWhere(
                (type) => type.toString() == "DayOfWeek.${json["closeDay"]}"),
        closeTime = json["closeTime"];
}
