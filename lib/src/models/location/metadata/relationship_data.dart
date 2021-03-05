/// Information of all parent and children locations related to this one.
class RelationshipData {
  /// The resource name of the Chain that this location is member of.
  /// [https://developers.google.com/my-business/reference/rest/v4/chains/search#google.mybusiness.v4.Locations.SearchChains](How to find Chain ID)
  final String? parentChain;

  RelationshipData(this.parentChain);

  RelationshipData.fromJson(Map<String, dynamic> json)
      : parentChain = json["parentChain"];
}
