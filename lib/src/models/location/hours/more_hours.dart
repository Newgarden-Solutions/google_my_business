import 'package:google_my_business/google_my_business.dart';

class MoreHours {
  final String hoursTypeId;
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
