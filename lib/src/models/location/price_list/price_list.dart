import 'package:json_annotation/json_annotation.dart';

import 'label.dart';
import 'section.dart';

part 'price_list.g.dart';

/// A list of item price information.
/// Price lists are structured as one or more price lists, each containing one or more sections with one or more items.
/// For example, food price lists may represent breakfast/lunch/dinner menus, with sections for burgers/steak/seafood.
@JsonSerializable()
class PriceList {
  final String? priceListId;
  final List<Label>? labels;
  final String? sourceUrl;
  final List<Section>? sections;

  PriceList(this.priceListId, this.labels, this.sourceUrl, this.sections);

  factory PriceList.fromJson(Map<String, dynamic> json) =>
      _$PriceListFromJson(json);
  Map<String, dynamic> toJson() => _$PriceListToJson(this);
}
