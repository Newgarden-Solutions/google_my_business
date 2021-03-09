import 'package:json_annotation/json_annotation.dart';

part 'profile.g.dart';

/// All information pertaining to the location's profile.
@JsonSerializable()
class Profile {
  /// Description of the location in your own voice, not editable by anyone else.
  final String? description;

  Profile(this.description);

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
