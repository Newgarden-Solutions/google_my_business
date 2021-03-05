import 'time_period.dart';

/// Represents the time periods that this location is open for business. Holds a collection of [TimePeriod] instances.
class BusinessHours {
  final List<TimePeriod>? periods;

  BusinessHours(this.periods);

  BusinessHours.fromJson(Map<String, dynamic> json)
      : periods = json["periods"] == null
            ? null
            : (json["periods"] as List)
                .map((periodJson) => TimePeriod.fromJson(periodJson))
                .toList();
}
