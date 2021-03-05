import 'item.dart';
import 'label.dart';

/// A section of the price list containing one or more items.
class Section {
  /// Required. ID for the section. Price list, section, and item IDs cannot be duplicated within this Location.
  final String? sectionId;

  /// Required. Language-tagged labels for the section.
  /// We recommend that section names and descriptions be 140 characters or less.
  /// At least one set of labels is required.
  final List<Label>? labels;

  /// Optional. Type of the current price list section. Default value is FOOD.
  final SectionType? sectionType;

  /// Items that are contained within this section of the price list.
  final List<Item>? items;

  Section(this.sectionId, this.labels, this.sectionType, this.items);

  Section.fromJson(Map<String, dynamic> json)
      : sectionId = json["sectionId"],
        labels = json["labels"] == null
            ? null
            : (json["labels"] as List)
                .map((labelJson) => Label.fromJson(labelJson))
                .toList(),
        sectionType = json["sectionType"] == null
            ? null
            : SectionType.values.firstWhere((type) =>
                type.toString() == "SectionType.${json["sectionType"]}"),
        items = json["items"] == null
            ? null
            : (json["items"] as List)
                .map((itemJson) => Item.fromJson(itemJson))
                .toList();
}

/// Type of the section.
enum SectionType {
  /// Not specified.
  SECTION_TYPE_UNSPECIFIED,

  /// Section contains items that represent food.
  FOOD,

  /// Section contains items that represent services.
  SERVICES,
}
