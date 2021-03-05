/// Represents a whole or partial calendar date, such as a birthday.
/// The time of day and time zone are either specified elsewhere or are insignificant.
/// The date is relative to the Gregorian Calendar.
///
/// This can represent one of the following:
///
/// A full date, with non-zero year, month, and day values
/// A month and day value, with a zero year, such as an anniversary
/// A year on its own, with zero month and day values
/// A year and month value, with a zero day, such as a credit card expiration date
class Date {
  /// Year of the date. Must be from 1 to 9999, or 0 to specify a date without a year.
  final int? year;

  /// Month of a year. Must be from 1 to 12, or 0 to specify a year without a month and day.
  final int? month;

  /// Day of a month. Must be from 1 to 31 and valid for the year and month, or 0 to specify a year by itself or a year and month where the day isn't significant.
  final int? day;

  Date(this.year, this.month, this.day);

  Date.fromJson(Map<String, dynamic> json)
      : year = json["year"],
        month = json["month"],
        day = json["day"];
}
