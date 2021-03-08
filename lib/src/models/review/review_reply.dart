import 'package:json_annotation/json_annotation.dart';

part 'review_reply.g.dart';

/// Represents the location owner/manager's reply to a review.
@JsonSerializable()
class ReviewReply {
  /// The body of the reply as plain text with markups. The maximum length is 4096 bytes.
  final String? comment;

  /// Output only. The timestamp for when the reply was last modified.
  ///
  /// A timestamp in RFC3339 UTC "Zulu" format, with nanosecond resolution and up to nine fractional digits.
  /// Examples: `"2014-10-02T15:01:23Z"` and `"2014-10-02T15:01:23.045123456Z"`.
  final String? updateTime;

  ReviewReply(this.comment, this.updateTime);

  factory ReviewReply.fromJson(Map<String, dynamic> json) =>
      _$ReviewReplyFromJson(json);
  Map<String, dynamic> toJson() => _$ReviewReplyToJson(this);
}
