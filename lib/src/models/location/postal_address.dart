/// Represents the address of the location
class PostalAddress {
  final String? languageCode;
  final String? locality;
  final String? regionCode;
  final String? postalCode;
  final String? administrativeArea;
  final String? sublocality;
  final List<String> addressLines;

  PostalAddress(
      this.languageCode,
      this.locality,
      this.regionCode,
      this.postalCode,
      this.administrativeArea,
      this.sublocality,
      this.addressLines);

  PostalAddress.fromJson(Map<String, dynamic> json)
      : languageCode = json["languageCode"],
        locality = json["locality"],
        regionCode = json["regionCode"],
        postalCode = json["postalCode"],
        administrativeArea = json["administrativeArea"],
        sublocality = json["sublocality"],
        addressLines = List<String>.from(json["addressLines"]);
}
