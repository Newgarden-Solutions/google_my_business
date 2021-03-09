import 'package:json_annotation/json_annotation.dart';

part 'ad_words_location_extensions.g.dart';

/// Additional information that is surfaced in AdWords.
@JsonSerializable()
class AdWordsLocationExtensions {
  /// An alternate phone number to display on AdWords location extensions instead of the location's primary phone number.
  final String? adPhone;

  AdWordsLocationExtensions(this.adPhone);

  factory AdWordsLocationExtensions.fromJson(Map<String, dynamic> json) =>
      _$AdWordsLocationExtensionsFromJson(json);
  Map<String, dynamic> toJson() => _$AdWordsLocationExtensionsToJson(this);
}
