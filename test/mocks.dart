import 'package:google_my_business/google_my_business.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

//region General

class GoogleSignInMock extends Mock implements GoogleSignIn {
  @override
  Stream<GoogleSignInAccount> get onCurrentUserChanged =>
      Stream.value(GoogleSignInAccountMock());
}

class GoogleSignInAccountMock extends Mock implements GoogleSignInAccount {}

//endregion

//region Locations

class LocationsManagerMock extends Mock implements LocationsManager {}

class HttpClientMock extends Mock implements http.Client {}

var testLocationsJson = """
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
