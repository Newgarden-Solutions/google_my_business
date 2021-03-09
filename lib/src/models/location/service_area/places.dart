import 'package:json_annotation/json_annotation.dart';

import 'place_info.dart';

part 'places.g.dart';

/// Defines the union of areas represented by a set of places.
@JsonSerializable()
class Places {
  /// The areas represented by place IDs. Limited to a maximum of 20 places.
  final List<PlaceInfo>? placeInfos;

  Places(this.placeInfos);

  factory Places.fromJson(Map<String, dynamic> json) => _$PlacesFromJson(json);
  Map<String, dynamic> toJson() => _$PlacesToJson(this);
}
