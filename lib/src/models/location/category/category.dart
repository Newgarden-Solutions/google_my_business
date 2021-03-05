import 'package:json_annotation/json_annotation.dart';

import 'more_hours_type.dart';
import 'service_type.dart';

part 'category.g.dart';

/// Represents the locations category describing what this business is (not what it does).
/// For a list of valid category IDs, and the mappings to their human-readable names,
/// see https://developers.google.com/my-business/reference/rest/v4/categories/list
@JsonSerializable()
class Category {
  final String? displayName;
  final String? categoryId;
  final List<ServiceType>? serviceTypes;
  final List<MoreHoursType>? moreHoursTypes;

  Category(this.displayName, this.categoryId, this.serviceTypes,
      this.moreHoursTypes);

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
