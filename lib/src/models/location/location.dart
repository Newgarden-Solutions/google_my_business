import 'category/category.dart';
import 'common/latlng.dart';
import 'hours/business_hours.dart';
import 'hours/special_hours.dart';
import 'metadata/ad_words_location_extensions.dart';
import 'metadata/location_key.dart';
import 'metadata/location_state.dart';
import 'metadata/metadata.dart';
import 'metadata/profile.dart';
import 'metadata/relationship_data.dart';
import 'open_info/open_info.dart';
import 'postal_address.dart';
import 'price_list/price_list.dart';
import 'service_area/service_area_business.dart';

/// Represents the location of the business
class Location {
  final String name;
  final String languageCode;
  final String storeCode;
  final String locationName;
  final String primaryPhone;
  final List<String> additionalPhones;
  final PostalAddress address;
  final Category primaryCategory;
  final List<Category> additionalCategories;
  final String websiteUrl;
  final BusinessHours regularHours;
  final SpecialHours specialHours;
  final ServiceAreaBusiness serviceArea;
  final LocationKey locationKey;
  final List<String> labels;
  final AdWordsLocationExtensions adWordsLocationExtensions;
  final LatLng latLng;
  final OpenInfo openInfo;
  final LocationState locationState;
  final Metadata metadata;
  final Profile profile;
  final List<PriceList> priceLists;
  final RelationshipData relationshipData;

  Location(
      this.name,
      this.languageCode,
      this.storeCode,
      this.locationName,
      this.primaryPhone,
      this.additionalPhones,
      this.address,
      this.primaryCategory,
      this.additionalCategories,
      this.websiteUrl,
      this.regularHours,
      this.specialHours,
      this.serviceArea,
      this.locationKey,
      this.labels,
      this.adWordsLocationExtensions,
      this.latLng,
      this.openInfo,
      this.locationState,
      this.metadata,
      this.profile,
      this.priceLists,
      this.relationshipData);

  Location.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        languageCode = json["languageCode"],
        storeCode = json["storeCode"],
        locationName = json["locationName"],
        primaryPhone = json["primaryPhone"],
        additionalPhones = json["additionalPhones"] == null
            ? null
            : List<String>.from(json["additionalPhones"]),
        address = json["address"] == null
            ? null
            : PostalAddress.fromJson(json["address"]),
        primaryCategory = json["primaryCategory"] == null
            ? null
            : Category.fromJson(json["primaryCategory"]),
        additionalCategories = json["additionalCategories"] == null
            ? null
            : (json["additionalCategories"] as List)
                .map((categoryJson) => Category.fromJson(categoryJson))
                .toList(),
        websiteUrl = json["websiteUrl"],
        regularHours = json["regularHours"] == null
            ? null
            : BusinessHours.fromJson(json["regularHours"]),
        specialHours = json["specialHours"] == null
            ? null
            : SpecialHours.fromJson(json["specialHours"]),
        serviceArea = json["serviceArea"] == null
            ? null
            : ServiceAreaBusiness.fromJson(json["serviceArea"]),
        locationKey = json["locationKey"] == null
            ? null
            : LocationKey.fromJson(json["locationKey"]),
        labels =
            json["labels"] == null ? null : List<String>.from(json["labels"]),
        adWordsLocationExtensions = json["adWordsLocationExtensions"] == null
            ? null
            : AdWordsLocationExtensions.fromJson(
                json["adWordsLocationExtensions"]),
        latLng =
            json["latlng"] == null ? null : LatLng.fromJson(json["latlng"]),
        openInfo = json["openInfo"] == null
            ? null
            : OpenInfo.fromJson(json["openInfo"]),
        locationState = json["locationState"] == null
            ? null
            : LocationState.fromJson(json["locationState"]),
        metadata = json["metadata"] == null
            ? null
            : Metadata.fromJson(json["metadata"]),
        profile =
            json["profile"] == null ? null : Profile.fromJson(json["profile"]),
        priceLists = json["priceLists"] == null
            ? null
            : (json["priceLists"] as List)
                .map((priceListJson) => PriceList.fromJson(priceListJson))
                .toList(),
        relationshipData = json["relationshipData"] == null
            ? null
            : RelationshipData.fromJson(json["relationshipData"]);
}
