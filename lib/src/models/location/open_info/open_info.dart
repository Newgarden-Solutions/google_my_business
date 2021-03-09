import 'package:json_annotation/json_annotation.dart';

import '../common/date.dart';
import 'open_for_business.dart';

part 'open_info.g.dart';

/// Information related to the opening state of the business.
@JsonSerializable()
class OpenInfo {
  /// Indicates whether or not the Location is currently open for business.
  /// All locations are open by default, unless updated to be closed.
  final OpenForBusiness status;

  /// Output only. Indicates whether this business is eligible for re-open.
  final bool? canReopen;

  /// The date on which the location first opened.
  /// If the exact day is not known, month and year only can be provided.
  /// The date must be in the past or be no more than one year in the future.
  final Date? openingDate;

  OpenInfo(this.status, this.canReopen, this.openingDate);

  factory OpenInfo.fromJson(Map<String, dynamic> json) =>
      _$OpenInfoFromJson(json);
  Map<String, dynamic> toJson() => _$OpenInfoToJson(this);
}
