import 'package:json_annotation/json_annotation.dart';

part 'label.g.dart';

/// Label to be used when displaying the price list, section, or item.
@JsonSerializable()
class Label {
  /// Required. Display name for the price list, section, or item.
  final String? displayName;

  /// Optional. Description of the price list, section, or item.
  final String? description;

  /// Optional. The BCP-47 language code that these strings apply for.
  /// Only one set of labels may be set per language.
  final String? languageCode;

  Label(this.displayName, this.description, this.languageCode);

  factory Label.fromJson(Map<String, dynamic> json) => _$LabelFromJson(json);
  Map<String, dynamic> toJson() => _$LabelToJson(this);
}
