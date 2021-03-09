import 'package:json_annotation/json_annotation.dart';

part 'place_info.g.dart';

/// Defines an area that's represented by a place ID.
@JsonSerializable()
class PlaceInfo {
  /// The localized name of the place. For example, Scottsdale, AZ.
  final String? name;

  /// The ID of the place. Must correspond to a https://developers.google.com/places/web-service/supported_types.
  final String? placeId;

  PlaceInfo(this.name, this.placeId);

  factory PlaceInfo.fromJson(Map<String, dynamic> json) =>
      _$PlaceInfoFromJson(json);
  Map<String, dynamic> toJson() => _$PlaceInfoToJson(this);
}
