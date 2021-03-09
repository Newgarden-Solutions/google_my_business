import 'package:json_annotation/json_annotation.dart';

part 'reviewer.g.dart';

/// Represents the author of the review.
@JsonSerializable()
class Reviewer {
  /// The profile photo link of the reviewer. Only populated if `isAnonymous` is false.
  final String? profilePhotoUrl;

  /// The name of the reviewer. Only populated with the reviewer's real name if `isAnonymous` is false.
  final String? displayName;

  /// Indicates whether the reviewer has opted to remain anonymous.
  final bool? isAnonymous;

  Reviewer(this.profilePhotoUrl, this.displayName, this.isAnonymous);

  factory Reviewer.fromJson(Map<String, dynamic> json) =>
      _$ReviewerFromJson(json);
  Map<String, dynamic> toJson() => _$ReviewerToJson(this);
}
