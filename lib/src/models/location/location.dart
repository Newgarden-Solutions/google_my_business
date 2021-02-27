import 'category/category.dart';
import 'common/latlng.dart';
import 'hours/business_hours.dart';
import 'hours/more_hours.dart';
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
  /// Google identifier for this location in the form: accounts/{accountId}/locations/{locationId}
  /// In the context of matches, this field will not be populated.
  final String name;

  /// The language of the location. Set during creation and not updateable.
  final String languageCode;

  /// External identifier for this location, which must be unique inside a given account.
  /// This is a means of associating the location with your own records.
  final String storeCode;

  /// Location name should reflect your business's real-world name, as used consistently on your storefront, website, and stationery, and as known to customers.
  /// Any additional information, when relevant, can be included in other fields of the resource (for example, `Address`, `Categories`).
  /// Don't add unnecessary information to your name (for example, prefer "Google" over "Google Inc. - Mountain View Corporate Headquarters").
  /// Don't include marketing taglines, store codes, special characters, hours or closed/open status, phone numbers, website URLs, service/product information, location/address or directions, or containment information (for example, "Chase ATM in Duane Reade").
  final String locationName;

  /// A phone number that connects to your individual business location as directly as possible.
  /// Use a local phone number instead of a central, call center helpline number whenever possible.
  final String primaryPhone;

  /// Up to two phone numbers (mobile or landline, no fax) at which your business can be called, in addition to your primary phone number.
  final List<String> additionalPhones;

  /// A precise, accurate address to describe your business location.
  /// PO boxes or mailboxes located at remote locations are not acceptable.
  /// At this time, you can specify a maximum of five `addressLines` values in the address.
  final PostalAddress address;

  /// Category that best describes the core business this location engages in.
  final Category primaryCategory;

  /// Additional categories to describe your business.
  /// Categories help your customers find accurate, specific results for services they're interested in.
  /// To keep your business information accurate and live, make sure that you use as few categories as possible to describe your overall core business.
  /// Choose categories that are as specific as possible, but representative of your main business.
  final List<Category> additionalCategories;

  /// A URL for this business.
  /// If possible, use a URL that represents this individual business location instead of a generic website/URL that represents all locations, or the brand.
  final String websiteUrl;

  /// Operating hours for the business.
  final BusinessHours regularHours;

  /// Special hours for the business.
  /// This typically includes holiday hours, and other times outside of regular operating hours.
  /// These override regular business hours.
  final SpecialHours specialHours;

  /// Service area businesses provide their service at the customer's location.
  /// If this business is a service area business, this field describes the area(s) serviced by the business.
  final ServiceAreaBusiness serviceArea;

  /// A collection of keys that link this business to other Google properties, such as a Google+ page and Google Maps Places.
  final LocationKey locationKey;

  /// A collection of free-form strings to allow you to tag your business.
  /// These labels are NOT user facing; only you can see them. Limited to 255 characters (per label).
  final List<String> labels;

  /// Additional information that is surfaced in AdWords.
  final AdWordsLocationExtensions adWordsLocationExtensions;

  /// User-provided latitude and longitude.
  /// When creating a location, this field is ignored if the provided address geocodes successfully.
  /// This field is only returned on get requests if the user-provided `latlng` value was accepted during create, or the `latlng` value was updated through the Google My Business website.
  /// This field cannot be updated.
  final LatLng latLng;

  /// A flag that indicates whether the location is currently open for business.
  final OpenInfo openInfo;

  /// Output only. A set of booleans that reflects the state of a location.
  /// https://support.google.com/business/answer/3480862
  final LocationState locationState;

  /// Output Only. Additional non-user-editable information.
  final Metadata metadata;

  /// Price list information for this location.
  final List<PriceList> priceLists;

  /// Describes your business in your own voice and shares with users the unique story of your business and offerings.
  final Profile profile;

  /// All locations and chain related to this one.
  final RelationshipData relationshipData;

  /// More hours for a business's different departments or specific customers.
  final List<MoreHours> moreHours;

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
      this.priceLists,
      this.profile,
      this.relationshipData,
      this.moreHours);

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
            : RelationshipData.fromJson(json["relationshipData"]),
        moreHours = json["moreHours"] == null
            ? null
            : (json["moreHours"] as List)
                .map((moreHoursJson) => MoreHours.fromJson(moreHoursJson))
                .toList();
}
