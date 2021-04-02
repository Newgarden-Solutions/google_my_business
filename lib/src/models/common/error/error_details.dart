import 'package:json_annotation/json_annotation.dart';

import 'field_violation.dart';

part 'error_details.g.dart';

@JsonSerializable()
/// Provides more details on the error if present
class ErrorDetails {
  final List<FieldViolation>? fieldViolations;

  ErrorDetails(this.fieldViolations);

  factory ErrorDetails.fromJson(Map<String, dynamic> json) => _$ErrorDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$ErrorDetailsToJson(this);
}