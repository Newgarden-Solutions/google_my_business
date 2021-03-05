import 'package:json_annotation/json_annotation.dart';

import 'item.dart';
import 'label.dart';
import 'section_type.dart';

part 'section.g.dart';

/// A section of the price list containing one or more items.
@JsonSerializable()
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

  factory Section.fromJson(Map<String, dynamic> json) =>
      _$SectionFromJson(json);
  Map<String, dynamic> toJson() => _$SectionToJson(this);
}
