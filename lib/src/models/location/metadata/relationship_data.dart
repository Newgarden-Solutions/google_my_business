import 'package:json_annotation/json_annotation.dart';

part 'relationship_data.g.dart';

/// Information of all parent and children locations related to this one.
@JsonSerializable()
class RelationshipData {
  /// The resource name of the Chain that this location is member of.
  /// [https://developers.google.com/my-business/reference/rest/v4/chains/search#google.mybusiness.v4.Locations.SearchChains](How to find Chain ID)
  final String? parentChain;

  RelationshipData(this.parentChain);

  factory RelationshipData.fromJson(Map<String, dynamic> json) =>
      _$RelationshipDataFromJson(json);
  Map<String, dynamic> toJson() => _$RelationshipDataToJson(this);
}
