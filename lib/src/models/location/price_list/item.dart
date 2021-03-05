import 'label.dart';
import 'money.dart';

/// A single list item. Each variation of an item in the price list should have its own Item with its own price data.
class Item {
  /// Required. ID for the item. Price list, section, and item IDs cannot be duplicated within this Location.
  final String? itemId;

  /// Required. Language-tagged labels for the item.
  /// We recommend that item names be 140 characters or less, and descriptions 250 characters or less.
  /// At least one set of labels is required.
  final List<Label>? labels;

  /// Optional. Price of the item.
  final Money? price;

  Item(this.itemId, this.labels, this.price);

  Item.fromJson(Map<String, dynamic> json)
      : itemId = json["itemId"],
        labels = json["labels"] == null
            ? null
            : (json["labels"] as List)
                .map((labelJson) => Label.fromJson(labelJson))
                .toList(),
        price = json["price"] == null ? null : Money.fromJson(json["price"]);
}
