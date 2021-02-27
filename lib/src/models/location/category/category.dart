import 'package:google_my_business/src/models/location/hours/more_hours_type.dart';

import 'service_type.dart';

/// Represents the locations category describing what this business is (not what it does).
/// For a list of valid category IDs, and the mappings to their human-readable names,
/// see https://developers.google.com/my-business/reference/rest/v4/categories/list
class Category {
  final String displayName;
  final String categoryId;
  final List<ServiceType> serviceTypes;
  final List<MoreHoursType> moreHoursTypes;

  Category(this.displayName, this.categoryId, this.serviceTypes,
      this.moreHoursTypes);

  Category.fromJson(Map<String, dynamic> json)
      : displayName = json["displayName"],
        categoryId = json["categoryId"],
        serviceTypes = json["serviceTypes"] == null
            ? null
            : (json["serviceTypes"] as List)
                .map((serviceType) => ServiceType.fromJson(serviceType))
                .toList(),
        moreHoursTypes = json["moreHoursTypes"] == null
            ? null
            : (json["moreHoursTypes"] as List)
                .map((serviceType) => MoreHoursType.fromJson(serviceType))
                .toList();
}
