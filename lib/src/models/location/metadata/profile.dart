/// All information pertaining to the location's profile.
class Profile {
  /// Description of the location in your own voice, not editable by anyone else.
  final String? description;

  Profile(this.description);

  Profile.fromJson(Map<String, dynamic> json)
      : description = json["description"];
}
