class ReviewReply {
  final String comment;
  final String updateTime;

  ReviewReply(this.comment, this.updateTime);

  ReviewReply.fromJson(Map<String, dynamic> json)
      : comment = json['comment'],
        updateTime = json['updateTime'];
}
