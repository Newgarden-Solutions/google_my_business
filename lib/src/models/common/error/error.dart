import 'package:json_annotation/json_annotation.dart';

import 'error_details.dart';

part 'error.g.dart';

/// Represents general response error
@JsonSerializable()
class Error {
  /// Code, might be HTTP or custom
  final int? code;

  /// Descriptive message of the error
  final String? message;

  /// General status in human-readable format
  final String? status;

  /// More details if present
  final List<ErrorDetails>? details;

  Error(this.code, this.message, this.status, {this.details});

  factory Error.fromJson(Map<String, dynamic> json) => _$ErrorFromJson(json);
  Map<String, dynamic> toJson() => _$ErrorToJson(this);

  @override
  String toString() {
    return '$code: $message\n${details?.map((e) => e.fieldViolations?.map((e) => 'field "${e.field}" is violated: ${e.description}'))}';
  }
}
