/// Additional non-user-editable information about the location.
class Metadata {
  /// A link to the location on Maps.
  final String? mapsUrl;

  /// A link to the page on Google Search where a customer can leave a review for the location.
  final String? newReviewUrl;

  Metadata(this.mapsUrl, this.newReviewUrl);

  Metadata.fromJson(Map<String, dynamic> json)
      : mapsUrl = json["mapsUrl"],
        newReviewUrl = json["newReviewUrl"];
}
