import 'package:json_annotation/json_annotation.dart';

part 'reviewer.g.dart';

@JsonSerializable()
class Reviewer {
  final String? profilePhotoUrl;
  final String? displayName;
  final bool? isAnonymous;

  Reviewer(this.profilePhotoUrl, this.displayName, this.isAnonymous);

  factory Reviewer.fromJson(Map<String, dynamic> json) =>
      _$ReviewerFromJson(json);
  Map<String, dynamic> toJson() => _$ReviewerToJson(this);
}
