/// Represents general response error
class Error {
  /// Code, might be HTTP or custom
  final int? code;

  /// Descriptive message of the error
  final String? message;

  /// General status in human-readable format
  final String? status;

  Error(this.code, this.message, this.status);

  Error.fromJson(Map<String, dynamic> json)
      : code = json["code"],
        message = json["message"],
        status = json["status"];
}
