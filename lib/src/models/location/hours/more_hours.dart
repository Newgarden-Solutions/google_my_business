import 'package:google_my_business/google_my_business.dart';

/// The time periods during which a location is open for certain types of business.
class MoreHours {
  /// Required. Type of hours.
  /// Clients should call {#link businessCategories:BatchGet} to get supported hours types for categories of their locations.
  final String hoursTypeId;

  /// Required. A collection of times that this location is open.
  /// Each period represents a range of hours when the location is open during the week.
  final List<TimePeriod> periods;

  MoreHours(this.hoursTypeId, this.periods);

  MoreHours.fromJson(Map<String, dynamic> json)
      : hoursTypeId = json["hoursTypeId"],
        periods = json["periods"] == null
            ? null
            : (json["periods"] as List)
                .map((periodJson) => TimePeriod.fromJson(periodJson))
                .toList();
}
