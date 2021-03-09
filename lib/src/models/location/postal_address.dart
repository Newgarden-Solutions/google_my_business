import 'package:json_annotation/json_annotation.dart';

part 'postal_address.g.dart';

/// Represents the address of the location
@JsonSerializable()
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

  factory PostalAddress.fromJson(Map<String, dynamic> json) =>
      _$PostalAddressFromJson(json);
  Map<String, dynamic> toJson() => _$PostalAddressToJson(this);
}
