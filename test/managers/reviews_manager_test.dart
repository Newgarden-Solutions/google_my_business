import 'package:flutter_test/flutter_test.dart';
import 'package:google_my_business/google_my_business.dart';
import 'package:google_my_business/src/managers/reviews_manager.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import '../mocks.dart';

void main() {
  ReviewsManager reviewsManager;
  var name;
  var pageSize;
  var nextPageToken;
  var httpClientMock;

  setUp(() {
    // Default values
    GMBAPI.instance.googleSignIn = GoogleSignInMock();

    name = "accounts/106941250772149994434/locations/4547712559962801423";
    reviewsManager = ReviewsManager(name: name);
    pageSize = ReviewsManager.MAX_PAGE_SIZE;
    nextPageToken = null;
    httpClientMock = HttpClientMock();
  });

  Future<void> _validateFetchReviews() async {
    await reviewsManager.fetchReviews(
        (reviews) {
          expect(reviews.length, 2);

          // Review with 1 star without comments / replies
          final review1 = reviews[0];

          expect(review1.reviewId,
              'AbFvOqmfI-JoFLOEqmBN-JqT0BFKxGR5b5t9ZuutWki9hbnFnp6h_tWsI-8SajSWhxmvwAFBAAgH');

          expect(review1.reviewer, isNotNull);
          expect(review1.reviewer.profilePhotoUrl,
              'https://lh3.googleusercontent.com/a-/AOh14GiSwzu2nbngpCmB3luP6Izd_KTv_wm2Zq0Op690SQ=c0x00000000-cc-rp-ba3');
          expect(review1.reviewer.displayName, 'Данил Бырзул');
          expect(review1.reviewer.isAnonymous, false);

          expect(review1.starRating, StarRating.ONE);

          expect(review1.createTime, '2019-12-19T16:55:27.082Z');

          expect(review1.updateTime, '2019-12-19T16:55:27.082Z');

          expect(review1.name,
              'accounts/106941250772149994434/locations/4547712559962801423/reviews/AbFvOqmfI-JoFLOEqmBN-JqT0BFKxGR5b5t9ZuutWki9hbnFnp6h_tWsI-8SajSWhxmvwAFBAAgH');

          // Review with 5 stars with comments / replies
          final review2 = reviews[1];

          expect(review2.reviewId,
              'AbFvOqkNhKOO17hiA6Dg1-HNrS6Vtjv71nAMxEdVXdIlVOC4xshndwUfGS9uSLgisU6T7hDMHMjsKg');

          expect(review2.reviewer, isNotNull);
          expect(review2.reviewer.profilePhotoUrl,
              'https://lh3.googleusercontent.com/a-/AOh14GgxnobyiCdv9hi_-L69VIJ9DxCoNxdWEcASBrnQ=c0x00000000-cc-rp');
          expect(review2.reviewer.displayName, 'Вячеслав Крот');
          expect(review2.reviewer.isAnonymous, false);

          expect(review2.starRating, StarRating.FIVE);

          expect(review2.comment,
              '(Translated by Google) Tasty, satisfying and inexpensive\n\n(Original)\nВкусно, сытно и недорого');

          expect(review2.createTime, '2020-09-07T19:27:46.840Z');

          expect(review2.updateTime, '2020-09-07T19:27:46.840Z');

          expect(review2.reviewReply, isNotNull);
          expect(review2.reviewReply.comment,
              'Спасибо за отзыв, приходите ещё 🙂');
          expect(review2.reviewReply.updateTime, '2020-10-17T06:49:49.916Z');

          expect(review2.name,
              'accounts/106941250772149994434/locations/4547712559962801423/reviews/AbFvOqkNhKOO17hiA6Dg1-HNrS6Vtjv71nAMxEdVXdIlVOC4xshndwUfGS9uSLgisU6T7hDMHMjsKg');
        },
        (progress, reviews) {},
        (response) {
          // No error should be triggered
        },
        httpClientMock,
        nextPageToken,
        pageSize);

    expect(reviewsManager.averageRating, 3);
    expect(reviewsManager.totalReviewCount, 2);
  }

  group('Reviews', () {
    test('[fetchReviews] should return a list of reviews on success', () async {
      when(httpClientMock.get(
              'https://mybusiness.googleapis.com/v4/$name/reviews?pageSize=$pageSize',
              headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response(testReviewsJson, 200,
              headers: await GMBAPI.instance.currentUser().authHeaders));

      await _validateFetchReviews();
    });

    test(
        '[fetchReviews] should return a list of reviews on success with next page token',
        () async {
          int count = 0;
      when(httpClientMock.get(any, headers: anyNamed('headers'))).thenAnswer(
          (_) async {
            if (count++ == 1) {
              return http.Response(testReviewsJson, 200,
                  headers: await GMBAPI.instance
                      .currentUser()
                      .authHeaders);
            } else {
              return http.Response(testReviewsNextPageJson, 200,
                  headers: await GMBAPI.instance
                      .currentUser()
                      .authHeaders);
            }
          });

      await _validateFetchReviews();
    });

    test(
        '[fetchReviews] should return a list of reviews on success with page token',
        () async {
      // Custom page token
      nextPageToken = "foo";

      when(httpClientMock.get(
              'https://mybusiness.googleapis.com/v4/$name/reviews?pageSize=$pageSize&pageToken=$nextPageToken',
              headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response(testReviewsJson, 200,
              headers: await GMBAPI.instance.currentUser().authHeaders));

      await _validateFetchReviews();
    });

    test('[fetchReviews] should set page size to MAX_PAGE_SIZE if bigger', () async {
      pageSize = ReviewsManager.MAX_PAGE_SIZE * 2;

      when(httpClientMock.get(
          'https://mybusiness.googleapis.com/v4/$name/reviews?pageSize=${ReviewsManager.MAX_PAGE_SIZE}',
          headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response(testReviewsJson, 200,
          headers: await GMBAPI.instance.currentUser().authHeaders));

      await _validateFetchReviews();
    });

    test('[fetchReviews] should call on error when request fails', () async {
      when(httpClientMock.get(
              'https://mybusiness.googleapis.com/v4/$name/reviews?pageSize=$pageSize',
              headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response('{}', 404));

      await reviewsManager.fetchReviews((reviews) {
        // No success should be triggered
      }, (progress, reviews) {
        // No progress should be triggered
      }, (error) {
        expect(error, isNull);
      }, httpClientMock, nextPageToken, pageSize);
    });

    test('[fetchReviews] should call on error when body is empty', () async {
      when(httpClientMock.get(
              'https://mybusiness.googleapis.com/v4/$name/reviews?pageSize=$pageSize',
              headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response('{}', 200));

      await reviewsManager.fetchReviews((reviews) {
        // No success should be triggered
      }, (progress, reviews) {
        // No progress should be triggered
      }, (error) {
        expect(error.code, 401);
        expect(error.message,
            'Failed to fetch reviews. Possibly not enough rights for a given location');
        expect(error.status, 'UNAUTHORIZED');
      }, httpClientMock, nextPageToken, pageSize);
    });

    test(
        '[fetchReviews] default client should be used if http client is null and the status code should be 401 with error response',
        () async {
      await reviewsManager.fetchReviews((reviews) {
        // No success should be triggered
      }, (progress, reviews) {
        // No progress should be triggered
      }, (error) {
        expect(error.code, 401);
        expect(error.message,
            "Request had invalid authentication credentials. Expected OAuth 2 access token, login cookie or other valid authentication credential. See https://developers.google.com/identity/sign-in/web/devconsole-project.");
        expect(error.status, "UNAUTHENTICATED");
      });
    });
  });
}

//region Mocks

final testReviewsJson = """
{
    "reviews": [
        {
            "reviewId": "AbFvOqmfI-JoFLOEqmBN-JqT0BFKxGR5b5t9ZuutWki9hbnFnp6h_tWsI-8SajSWhxmvwAFBAAgH",
            "reviewer": {
                "profilePhotoUrl": "https://lh3.googleusercontent.com/a-/AOh14GiSwzu2nbngpCmB3luP6Izd_KTv_wm2Zq0Op690SQ=c0x00000000-cc-rp-ba3",
                "displayName": "Данил Бырзул"
            },
            "starRating": "ONE",
            "createTime": "2019-12-19T16:55:27.082Z",
            "updateTime": "2019-12-19T16:55:27.082Z",
            "name": "accounts/106941250772149994434/locations/4547712559962801423/reviews/AbFvOqmfI-JoFLOEqmBN-JqT0BFKxGR5b5t9ZuutWki9hbnFnp6h_tWsI-8SajSWhxmvwAFBAAgH"
        },
        {
            "reviewId": "AbFvOqkNhKOO17hiA6Dg1-HNrS6Vtjv71nAMxEdVXdIlVOC4xshndwUfGS9uSLgisU6T7hDMHMjsKg",
            "reviewer": {
                "profilePhotoUrl": "https://lh3.googleusercontent.com/a-/AOh14GgxnobyiCdv9hi_-L69VIJ9DxCoNxdWEcASBrnQ=c0x00000000-cc-rp",
                "displayName": "Вячеслав Крот"
            },
            "starRating": "FIVE",
            "comment": "(Translated by Google) Tasty, satisfying and inexpensive\\n\\n(Original)\\nВкусно, сытно и недорого",
            "createTime": "2020-09-07T19:27:46.840Z",
            "updateTime": "2020-09-07T19:27:46.840Z",
            "reviewReply": {
                "comment": "Спасибо за отзыв, приходите ещё 🙂",
                "updateTime": "2020-10-17T06:49:49.916Z"
            },
            "name": "accounts/106941250772149994434/locations/4547712559962801423/reviews/AbFvOqkNhKOO17hiA6Dg1-HNrS6Vtjv71nAMxEdVXdIlVOC4xshndwUfGS9uSLgisU6T7hDMHMjsKg"
        }
    ],
    "averageRating": 3,
    "totalReviewCount": 2
}
""";

final testReviewsNextPageJson = """
{
    "reviews": [],
    "averageRating": 0,
    "totalReviewCount": 0,
    "nextPageToken": "foo"
}
""";

//endregion
