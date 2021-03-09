import 'package:json_annotation/json_annotation.dart';

import 'time_period.dart';

part 'business_hours.g.dart';

/// Represents the time periods that this location is open for business. Holds a collection of [TimePeriod] instances.
@JsonSerializable()
class BusinessHours {
  final List<TimePeriod>? periods;

  BusinessHours(this.periods);

  factory BusinessHours.fromJson(Map<String, dynamic> json) =>
      _$BusinessHoursFromJson(json);
  Map<String, dynamic> toJson() => _$BusinessHoursToJson(this);
}
