import 'package:json_annotation/json_annotation.dart';

part 'field_violation.g.dart';

@JsonSerializable()
/// Describes details of the field violated in request
class FieldViolation {
  final String? field;
  final String? description;

  FieldViolation(this.field, this.description);

  factory FieldViolation.fromJson(Map<String, dynamic> json) => _$FieldViolationFromJson(json);
  Map<String, dynamic> toJson() => _$FieldViolationToJson(this);
}