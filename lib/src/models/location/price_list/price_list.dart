import 'label.dart';
import 'section.dart';

/// A list of item price information.
/// Price lists are structured as one or more price lists, each containing one or more sections with one or more items.
/// For example, food price lists may represent breakfast/lunch/dinner menus, with sections for burgers/steak/seafood.
class PriceList {
  final String? priceListId;
  final List<Label>? labels;
  final String? sourceUrl;
  final List<Section>? sections;

  PriceList(this.priceListId, this.labels, this.sourceUrl, this.sections);

  PriceList.fromJson(Map<String, dynamic> json)
      : priceListId = json["priceListId"],
        labels = json["labels"] == null
            ? null
            : (json["labels"] as List)
                .map((labelJson) => Label.fromJson(labelJson))
                .toList(),
        sourceUrl = json["sourceUrl"],
        sections = json["sections"] == null
            ? null
            : (json["sections"] as List)
                .map((sectionJson) => Section.fromJson(sectionJson))
                .toList();
}
