import 'package:flutter_test/flutter_test.dart';
import 'package:google_my_business/google_my_business.dart';
import 'package:google_my_business/src/google_my_business.dart';
import 'package:google_my_business/src/managers/locations_manager.dart';
import 'package:google_my_business/src/models/location/price_list/section_type.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import '../../stubs.dart';
import '../../stubs.mocks.dart';

void main() {
  late LocationsManager locationsManager;

  var accountId;
  var httpClientMock;

  // Mocks
  late MockGoogleSignIn mockGoogleSignIn;
  late MockGoogleSignInAccount mockGoogleSignInAccount;

  setUp(() {
    // Default values
    mockGoogleSignIn = MockGoogleSignIn();
    mockGoogleSignInAccount = MockGoogleSignInAccount();
    GoogleMyBusiness.instance.googleSignIn = mockGoogleSignIn;

    accountId = "106941250772149994434";
    locationsManager = LocationsManager(accountId: accountId);
    httpClientMock = MockClient();

    when(GoogleMyBusiness.instance.currentUser())
        .thenReturn(mockGoogleSignInAccount);
    when(mockGoogleSignInAccount.authHeaders)
        .thenAnswer((_) => mockAuthHeaders);
  });

  group('Locations', () {
    test('[fetchLocations] should return a list of locations on success',
        () async {
      when(httpClientMock.get(
              Uri.parse(
                  'https://mybusiness.googleapis.com/v4/accounts/$accountId/locations'),
              headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response(testLocationsJson, 200,
              headers:
                  await GoogleMyBusiness.instance.currentUser()!.authHeaders));

      await locationsManager.fetchLocations((locations) {
        expect(locations!.length, 1);

        final location = locations[0];

        expect(location.locationName, 'Хінкальня у Правді');

        expect(location.primaryPhone, '097 706 3399');

        expect(location.primaryCategory, isNotNull);
        expect(location.primaryCategory!.displayName,
            'Ресторан грузинської кухні');
        expect(
            location.primaryCategory!.categoryId, 'gcid:georgian_restaurant');
        expect(location.primaryCategory!.moreHoursTypes!.length, 1);
        expect(
            location.primaryCategory!.moreHoursTypes![0].hoursTypeId, 'ACCESS');
        expect(
            location.primaryCategory!.moreHoursTypes![0].displayName, 'Access');
        expect(
            location.primaryCategory!.moreHoursTypes![0].localizedDisplayName,
            'Години роботи');

        expect(location.websiteUrl, 'http://hinkalnya.com.ua/');

        expect(location.regularHours, isNotNull);
        expect(location.regularHours!.periods, isNotNull);
        expect(location.regularHours!.periods!.length, 7);
        expect(location.regularHours!.periods![0].openDay, DayOfWeek.SUNDAY);
        expect(location.regularHours!.periods![0].openTime, '11:00');
        expect(location.regularHours!.periods![0].closeDay, DayOfWeek.SUNDAY);
        expect(location.regularHours!.periods![0].closeTime, '22:00');

        expect(location.specialHours, isNotNull);
        expect(location.specialHours!.specialHourPeriods, isNotNull);
        expect(location.specialHours!.specialHourPeriods!.length, 3);
        expect(
            location.specialHours!.specialHourPeriods![0].startDate, isNotNull);
        expect(
            location.specialHours!.specialHourPeriods![0].startDate.year, 2019);
        expect(
            location.specialHours!.specialHourPeriods![0].startDate.month, 4);
        expect(location.specialHours!.specialHourPeriods![0].startDate.day, 28);
        expect(location.specialHours!.specialHourPeriods![0].openTime, "12:00");
        expect(
            location.specialHours!.specialHourPeriods![0].endDate, isNotNull);
        expect(
            location.specialHours!.specialHourPeriods![0].endDate.year, 2019);
        expect(location.specialHours!.specialHourPeriods![0].endDate.month, 4);
        expect(location.specialHours!.specialHourPeriods![0].endDate.day, 28);
        expect(
            location.specialHours!.specialHourPeriods![0].closeTime, "22:00");

        expect(location.serviceArea, isNotNull);
        expect(location.serviceArea!.businessType,
            BusinessType.CUSTOMER_AND_BUSINESS_LOCATION);
        expect(location.serviceArea!.places, isNotNull);
        expect(location.serviceArea!.places!.placeInfos, isNotNull);
        expect(location.serviceArea!.places!.placeInfos!.length, 1);
        expect(location.serviceArea!.places!.placeInfos![0].name,
            'Львов, Львовская область, Украина, 79000');
        expect(location.serviceArea!.places!.placeInfos![0].placeId,
            'ChIJDchgK3pY2UARmdiS6By9U0U');

        expect(location.locationKey, isNotNull);
        expect(location.locationKey!.placeId, 'ChIJDchgK3pY2UARmdiS6By9U0U');
        expect(location.locationKey!.requestId,
            '47d5953c-1ad5-48dd-860f-35e6392d0404');

        expect(location.openInfo, isNotNull);
        expect(location.openInfo!.status, OpenForBusiness.OPEN);
        expect(location.openInfo!.canReopen, true);

        expect(location.locationState, isNotNull);
        expect(location.locationState!.isGoogleUpdated, true);
        expect(location.locationState!.canUpdate, true);
        expect(location.locationState!.canDelete, true);
        expect(location.locationState!.isVerified, true);
        expect(location.locationState!.isPublished, true);
        expect(location.locationState!.canHaveFoodMenus, true);

        expect(location.metadata, isNotNull);
        expect(location.metadata!.mapsUrl,
            'https://maps.google.com/maps?cid=4995544343542683801');
        expect(location.metadata!.newReviewUrl,
            'https://search.google.com/local/writereview?placeid=ChIJDchgK3pY2UARmdiS6By9U0U');

        expect(location.languageCode, 'uk');

        expect(location.priceLists, isNotNull);
        expect(location.priceLists!.length, 1);
        expect(location.priceLists![0].priceListId,
            'a1a0704c-f90e-4cf9-8892-b4b5832a4d5b');
        expect(location.priceLists![0].labels, isNotNull);
        expect(location.priceLists![0].labels!.length, 1);
        expect(location.priceLists![0].labels![0].displayName, 'Меню');
        expect(location.priceLists![0].labels![0].description, isNull);
        expect(location.priceLists![0].labels![0].languageCode, isNull);
        expect(location.priceLists![0].sections, isNotNull);
        expect(location.priceLists![0].sections!.length, 1);
        expect(location.priceLists![0].sections![0].sectionId,
            '74d7968e-2b92-48c4-82f7-9bd0d31503fa');
        expect(
            location.priceLists![0].sections![0].sectionType, SectionType.FOOD);
        expect(location.priceLists![0].sections![0].labels, isNotNull);
        expect(location.priceLists![0].sections![0].labels!.length, 1);
        expect(location.priceLists![0].sections![0].labels![0].displayName,
            'Хінкалі');
        expect(location.priceLists![0].sections![0].labels![0].description,
            isNull);
        expect(location.priceLists![0].sections![0].labels![0].languageCode,
            isNull);
        expect(location.priceLists![0].sections![0].items, isNotNull);
        expect(location.priceLists![0].sections![0].items!.length, 1);
        expect(location.priceLists![0].sections![0].items![0].itemId,
            'c8133bf8-948a-4c74-aa1e-e9fdd7115264');
        expect(
            location.priceLists![0].sections![0].items![0].labels, isNotNull);
        expect(
            location.priceLists![0].sections![0].items![0].labels!.length, 1);
        expect(
            location
                .priceLists![0].sections![0].items![0].labels![0].displayName,
            "Хінкалі з м'ясом (1 шт)");
        expect(
            location
                .priceLists![0].sections![0].items![0].labels![0].description,
            isNull);
        expect(
            location
                .priceLists![0].sections![0].items![0].labels![0].languageCode,
            isNull);
        expect(location.priceLists![0].sections![0].items![0].price, isNotNull);
        expect(
            location.priceLists![0].sections![0].items![0].price!.currencyCode,
            'UAH');
        expect(
            location.priceLists![0].sections![0].items![0].price!.units, '19');

        expect(location.address, isNotNull);
        expect(location.address!.regionCode, 'UA');
        expect(location.address!.languageCode, 'uk-Latn');
        expect(location.address!.postalCode, '49000');
        expect(location.address!.administrativeArea, 'Dnipropetrovsk oblast');
        expect(location.address!.locality, 'Дніпро́');
        expect(location.address!.addressLines, isNotNull);
        expect(location.address!.addressLines, isNotEmpty);
        expect(location.address!.addressLines.length, 2);
        expect(location.address!.addressLines[0], '31Д');
        expect(
            location.address!.addressLines[1], 'проспект Слобожанський, 31Д');

        expect(location.profile, isNotNull);
        expect(location.profile!.description, 'Ресторан грузинської кухні');

        expect(location.moreHours, null);
      }, (error) {
        // No error should be triggered
      }, httpClientMock);
    });

    test('[fetchLocations] should call on error when request fails', () async {
      when(httpClientMock.get(
              Uri.parse(
                  'https://mybusiness.googleapis.com/v4/accounts/$accountId/locations'),
              headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response("{}", 404));

      await locationsManager.fetchLocations((locations) {
        // No success should be triggered
      }, (error) {
        expect(error, isNull);
      }, httpClientMock);
    });

    test(
        '[fetchLocations] default client should be used if http client is null and the status code should be 401 with error response',
        () async {
      await locationsManager.fetchLocations((locations) {
        // No success should be triggered
      }, (error) {
        expect(error!.code, 401);
        expect(error.message,
            "Request had invalid authentication credentials. Expected OAuth 2 access token, login cookie or other valid authentication credential. See https://developers.google.com/identity/sign-in/web/devconsole-project.");
        expect(error.status, "UNAUTHENTICATED");
      });
    });
  });
}

//region Mocks

class LocationsManagerMock extends Mock implements LocationsManager {}

// Dummy json made from different parts.
// Semantically some values might not be accurate (e.g. placeId different or so) so ignore it.
final testLocationsJson = """
{
    "locations": [
        {
            "name": "accounts/106941250772149994434/locations/4547712559962801423",
            "locationName": "Хінкальня у Правді",
            "primaryPhone": "097 706 3399",
            "primaryCategory": {
                "displayName": "Ресторан грузинської кухні",
                "categoryId": "gcid:georgian_restaurant",
                "moreHoursTypes": [
                    {
                        "hoursTypeId": "ACCESS",
                        "displayName": "Access",
                        "localizedDisplayName": "Години роботи"
                    }
                ]
            },
            "websiteUrl": "http://hinkalnya.com.ua/",
            "locationKey": {
                "placeId": "ChIJDchgK3pY2UARmdiS6By9U0U",
                "requestId": "47d5953c-1ad5-48dd-860f-35e6392d0404"
            },
            "regularHours": {
                "periods": [
                    {
                        "openDay": "SUNDAY",
                        "openTime": "11:00",
                        "closeDay": "SUNDAY",
                        "closeTime": "22:00"
                    },
                    {
                        "openDay": "MONDAY",
                        "openTime": "11:00",
                        "closeDay": "MONDAY",
                        "closeTime": "22:00"
                    },
                    {
                        "openDay": "TUESDAY",
                        "openTime": "11:00",
                        "closeDay": "TUESDAY",
                        "closeTime": "22:00"
                    },
                    {
                        "openDay": "WEDNESDAY",
                        "openTime": "11:00",
                        "closeDay": "WEDNESDAY",
                        "closeTime": "22:00"
                    },
                    {
                        "openDay": "THURSDAY",
                        "openTime": "11:00",
                        "closeDay": "THURSDAY",
                        "closeTime": "22:00"
                    },
                    {
                        "openDay": "FRIDAY",
                        "openTime": "11:00",
                        "closeDay": "FRIDAY",
                        "closeTime": "22:00"
                    },
                    {
                        "openDay": "SATURDAY",
                        "openTime": "11:00",
                        "closeDay": "SATURDAY",
                        "closeTime": "22:00"
                    }
                ]
            },
            "specialHours": {
                "specialHourPeriods": [
                    {
                        "startDate": {
                            "year": 2019,
                            "month": 4,
                            "day": 28
                        },
                        "openTime": "12:00",
                        "endDate": {
                            "year": 2019,
                            "month": 4,
                            "day": 28
                        },
                        "closeTime": "22:00"
                    },
                    {
                        "startDate": {
                            "year": 2019,
                            "month": 4,
                            "day": 29
                        },
                        "openTime": "11:00",
                        "endDate": {
                            "year": 2019,
                            "month": 4,
                            "day": 29
                        },
                        "closeTime": "22:00"
                    },
                    {
                        "startDate": {
                            "year": 2019,
                            "month": 5,
                            "day": 1
                        },
                        "openTime": "10:00",
                        "endDate": {
                            "year": 2019,
                            "month": 5,
                            "day": 1
                        },
                        "closeTime": "22:00"
                    }
                ]
            },
            "serviceArea": {
                "businessType": "CUSTOMER_AND_BUSINESS_LOCATION",
                "places": {
                    "placeInfos": [
                        {
                            "name": "Львов, Львовская область, Украина, 79000",
                            "placeId": "ChIJDchgK3pY2UARmdiS6By9U0U"
                        }
                    ]
                }
            },
            "openInfo": {
                "status": "OPEN",
                "canReopen": true
            },
            "locationState": {
                "isGoogleUpdated": true,
                "canUpdate": true,
                "canDelete": true,
                "isVerified": true,
                "isPublished": true,
                "canHaveFoodMenus": true
            },
            "metadata": {
                "mapsUrl": "https://maps.google.com/maps?cid=4995544343542683801",
                "newReviewUrl": "https://search.google.com/local/writereview?placeid=ChIJDchgK3pY2UARmdiS6By9U0U"
            },
            "languageCode": "uk",
            "priceLists": [
                {
                    "priceListId": "a1a0704c-f90e-4cf9-8892-b4b5832a4d5b",
                    "labels": [
                        {
                            "displayName": "Меню"
                        }
                    ],
                    "sections": [
                        {
                            "sectionId": "74d7968e-2b92-48c4-82f7-9bd0d31503fa",
                            "labels": [
                                {
                                    "displayName": "Хінкалі"
                                }
                            ],
                            "items": [
                                {
                                    "itemId": "c8133bf8-948a-4c74-aa1e-e9fdd7115264",
                                    "labels": [
                                        {
                                            "displayName": "Хінкалі з м'ясом (1 шт)"
                                        }
                                    ],
                                    "price": {
                                        "currencyCode": "UAH",
                                        "units": "19"
                                    }
                                }
                            ],
                            "sectionType": "FOOD"
                        }
                    ]
                }
            ],
            "address": {
                "regionCode": "UA",
                "languageCode": "uk-Latn",
                "postalCode": "49000",
                "administrativeArea": "Dnipropetrovsk oblast",
                "locality": "Дніпро́",
                "addressLines": [
                    "31Д",
                    "проспект Слобожанський, 31Д"
                ]
            },
            "profile": {
                "description": "Ресторан грузинської кухні"
            }
        }
    ]
}
""";

final testErrorJson = """
{
    "error": {
        "code": 401,
        "message": "Request had invalid authentication credentials. Expected OAuth 2 access token, login cookie or other valid authentication credential. See https://developers.google.com/identity/sign-in/web/devconsole-project.",
        "status": "UNAUTHENTICATED"
    }
}
""";

//endregion
