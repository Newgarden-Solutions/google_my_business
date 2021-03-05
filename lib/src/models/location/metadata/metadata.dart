import 'package:json_annotation/json_annotation.dart';

part 'metadata.g.dart';

/// Additional non-user-editable information about the location.
@JsonSerializable()
class Metadata {
  /// A link to the location on Maps.
  final String? mapsUrl;

  /// A link to the page on Google Search where a customer can leave a review for the location.
  final String? newReviewUrl;

  Metadata(this.mapsUrl, this.newReviewUrl);

  factory Metadata.fromJson(Map<String, dynamic> json) =>
      _$MetadataFromJson(json);
  Map<String, dynamic> toJson() => _$MetadataToJson(this);
}
