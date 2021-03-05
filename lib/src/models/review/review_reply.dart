import 'package:json_annotation/json_annotation.dart';

part 'review_reply.g.dart';

@JsonSerializable()
class ReviewReply {
  final String? comment;
  final String? updateTime;

  ReviewReply(this.comment, this.updateTime);

  factory ReviewReply.fromJson(Map<String, dynamic> json) =>
      _$ReviewReplyFromJson(json);
  Map<String, dynamic> toJson() => _$ReviewReplyToJson(this);
}
