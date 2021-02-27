class Reviewer {
  final String profilePhotoUrl;
  final String displayName;
  final bool isAnonymous;

  Reviewer(this.profilePhotoUrl, this.displayName, this.isAnonymous);

  Reviewer.fromJson(Map<String, dynamic> json)
      : profilePhotoUrl = json['profilePhotoUrl'],
        displayName = json['displayName'],
        isAnonymous = json['isAnonymous'] == null ? false : json['isAnonymous'];
}
