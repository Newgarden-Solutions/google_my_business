import 'package:flutter_test/flutter_test.dart';
import 'package:google_my_business/src/managers/locations_manager.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import '../mocks.dart';

void main() {
  group('Locations', () {
    test('[fetchLocations] should return a list of locations on success',
        () async {
      final locationsManagerMock = LocationsManagerMock();
      final accountId = "106941250772149994434";
      final httpClientMock = HttpClientMock();

      when(locationsManagerMock.accountId).thenReturn(accountId);
      when(httpClientMock.get(
        'https://mybusiness.googleapis.com/v4/accounts/$accountId/locations',
      )).thenAnswer((_) async => http.Response(testLocationsJson, 200));

      locationsManagerMock.fetchLocations((locations) {
        expect(locations.length, 1);

        final location = locations[0];

        expect(location.locationName, 'Хінкальня у Правді');

        expect(location.primaryPhone, '097 706 3399');

        expect(location.primaryCategory, isNotNull);
        expect(
            location.primaryCategory.displayName, 'Ресторан грузинської кухні');
        expect(location.primaryCategory.categoryId, 'gcid:georgian_restaurant');
        expect(location.primaryCategory.moreHoursTypes.length, 9);

        final moreHoursType = location.primaryCategory.moreHoursTypes[0];

        expect(moreHoursType.hoursTypeId, 'ACCESS');
        expect(moreHoursType.displayName, 'Access');
        expect(moreHoursType.localizedDisplayName, 'Години роботи');

        expect(location.websiteUrl, 'http://hinkalnya.com.ua/');

        expect(location.locationKey, isNotNull);
        expect(location.locationKey.placeId, 'ChIJDchgK3pY2UARmdiS6By9U0U');
        expect(location.locationKey.requestId,
            '47d5953c-1ad5-48dd-860f-35e6392d0404');

        expect(location.openInfo, isNotNull);
        expect(location.openInfo.status, 'OPEN');
        expect(location.openInfo.canReopen, true);

        expect(location.locationState, isNotNull);
        expect(location.locationState.isGoogleUpdated, true);
        expect(location.locationState.canUpdate, true);
        expect(location.locationState.canDelete, true);
        expect(location.locationState.isVerified, true);
        expect(location.locationState.isPublished, true);
        expect(location.locationState.canHaveFoodMenus, true);

        expect(location.metadata, isNotNull);
        expect(location.metadata.mapsUrl,
            'https://maps.google.com/maps?cid=4995544343542683801');
        expect(location.metadata.newReviewUrl,
            'https://search.google.com/local/writereview?placeid=ChIJDchgK3pY2UARmdiS6By9U0U');

        expect(location.languageCode, 'uk');

        expect(location.address, isNotNull);
        expect(location.address.regionCode, 'UA');
        expect(location.address.languageCode, 'uk-Latn');
        expect(location.address.postalCode, '49000');
        expect(location.address.administrativeArea, 'Dnipropetrovsk oblast');
        expect(location.address.locality, 'Дніпро́');
        expect(location.address.addressLines, isNotNull);
        expect(location.address.addressLines, isNotEmpty);
        expect(location.address.addressLines.length, 2);
        expect(location.address.addressLines[0], '31Д');
        expect(location.address.addressLines[1], 'проспект Слобожанський, 31Д');

        expect(location.moreHours, null);
      }, (response) {
        // No error should be triggered
      }, httpClientMock);
    });

    test('[fetchLocations] should call on error when request fails', () async {
      final locationsManagerMock = LocationsManagerMock();
      final accountId = "106941250772149994434";
      final httpClientMock = HttpClientMock();

      when(locationsManagerMock.accountId).thenReturn(accountId);
      when(httpClientMock.get(
        'https://mybusiness.googleapis.com/v4/accounts/$accountId/locations',
      )).thenAnswer((_) async => http.Response('Not found', 404));

      locationsManagerMock.fetchLocations((locations) {
        // No success should be triggered
      }, (response) {
        expect(response.statusCode, 404);
        expect(response.body, 'Not found');
      }, httpClientMock);
    });
  });
}

//region Mocks

class LocationsManagerMock extends Mock implements LocationsManager {}

final testLocationsJson = """
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
            },
            {
                "hoursTypeId": "BRUNCH",
                "displayName": "Brunch",
                "localizedDisplayName": "Пізній сніданок"
            },
            {
                "hoursTypeId": "DELIVERY",
                "displayName": "Delivery",
                "localizedDisplayName": "Доставка"
            },
            {
                "hoursTypeId": "DRIVE_THROUGH",
                "displayName": "Drive through",
                "localizedDisplayName": "Обслуговування без виходу з автомобіля"
            },
            {
                "hoursTypeId": "HAPPY_HOUR",
                "displayName": "Happy hours",
                "localizedDisplayName": "Години знижок"
            },
            {
                "hoursTypeId": "KITCHEN",
                "displayName": "Kitchen",
                "localizedDisplayName": "Години роботи кухні"
            },
            {
                "hoursTypeId": "ONLINE_SERVICE_HOURS",
                "displayName": "Online service hours",
                "localizedDisplayName": "Графік роботи онлайн"
            },
            {
                "hoursTypeId": "TAKEOUT",
                "displayName": "Takeout",
                "localizedDisplayName": "Їжа із собою"
            },
            {
                "hoursTypeId": "SENIOR_HOURS",
                "displayName": "Senior hours",
                "localizedDisplayName": "Час для літніх"
            }
        ]
    },
    "websiteUrl": "http://hinkalnya.com.ua/",
    "locationKey": {
        "placeId": "ChIJDchgK3pY2UARmdiS6By9U0U",
        "requestId": "47d5953c-1ad5-48dd-860f-35e6392d0404"
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
    }
}
""";

//endregion