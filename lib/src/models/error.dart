import 'package:json_annotation/json_annotation.dart';

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

  Error(this.code, this.message, this.status);

  factory Error.fromJson(Map<String, dynamic> json) => _$ErrorFromJson(json);
  Map<String, dynamic> toJson() => _$ErrorToJson(this);
}
