/// Additional information that is surfaced in AdWords.
class AdWordsLocationExtensions {
  /// An alternate phone number to display on AdWords location extensions instead of the location's primary phone number.
  final String? adPhone;

  AdWordsLocationExtensions(this.adPhone);

  AdWordsLocationExtensions.fromJson(Map<String, dynamic> json)
      : adPhone = json["adPhone"];
}
