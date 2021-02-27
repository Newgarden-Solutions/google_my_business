import 'package:flutter_test/flutter_test.dart';
import 'package:google_my_business/src/managers/reviews_manager.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import '../mocks.dart';

void main() {
  group('Reviews', () {
    test('[fetchReviews] should return a list of reviews on success', () async {
      final reviewsManagerMock = ReviewsManagerMock();
      final name = "accounts/106941250772149994434/locations/4547712559962801423";
      final pageSize = 50;
      final pageToken = "foo";
      final httpClientMock = HttpClientMock();

      when(reviewsManagerMock.name).thenReturn(name);
      when(httpClientMock.get(
        'https://mybusiness.googleapis.com/v4/$name/reviews?pageSize=$pageSize&$pageToken',
      )).thenAnswer((_) async => http.Response(testReviewsJson, 200));

      reviewsManagerMock.fetchReviews((reviews) {
        expect(reviews.length, 5);
      }, (progress, reviews) {
        
      }, (response) {
        // No error should be triggered
      }, httpClientMock);
    });

    test('[fetchReviews] should call on error when request fails', () async {
      final reviewsManagerMock = ReviewsManagerMock();
      final name = "accounts/106941250772149994434/locations/4547712559962801423";
      final pageSize = 50;
      final pageToken = "foo";
      final httpClientMock = HttpClientMock();

      when(reviewsManagerMock.name).thenReturn(name);
      when(httpClientMock.get(
        'https://mybusiness.googleapis.com/v4/$name/reviews?pageSize=$pageSize&$pageToken',
      )).thenAnswer((_) async => http.Response('Not found', 404));

      reviewsManagerMock.fetchReviews((reviews) {
        // No success should be triggered
      }, (progress, reviews) {
        // No progress should be triggered
      }, (response) {
        expect(response.statusCode, 404);
        expect(response.body, 'Not found');
      }, httpClientMock);
    });
  });
}

//region Mocks

class ReviewsManagerMock extends Mock implements ReviewsManager {}

final testReviewsJson = """
{
    "reviews": [
        {
            "reviewId": "AbFvOqkNhKOO17hiA6Dg1-HNrS6Vtjv71nAMxEdVXdIlVOC4xshndwUfGS9uSLgisU6T7hDMHMjsKg",
            "reviewer": {
                "profilePhotoUrl": "https://lh3.googleusercontent.com/a-/AOh14GgxnobyiCdv9hi_-L69VIJ9DxCoNxdWEcASBrnQ=c0x00000000-cc-rp",
                "displayName": "Вячеслав Крот"
            },
            "starRating": "FIVE",
            "comment": "(Translated by Google) Tasty, satisfying and inexpensive\n\n(Original)\nВкусно, сытно и недорого",
            "createTime": "2020-09-07T19:27:46.840Z",
            "updateTime": "2020-09-07T19:27:46.840Z",
            "reviewReply": {
                "comment": "Спасибо за отзыв, приходите ещё 🙂",
                "updateTime": "2020-10-17T06:49:49.916Z"
            },
            "name": "accounts/106941250772149994434/locations/4547712559962801423/reviews/AbFvOqkNhKOO17hiA6Dg1-HNrS6Vtjv71nAMxEdVXdIlVOC4xshndwUfGS9uSLgisU6T7hDMHMjsKg"
        },
        {
            "reviewId": "AbFvOqnGJMVHC9ldjkQyv4ku857KmmbRFshTINqBbQBWq7B4rCHE9oTccWFj1dYMoYkQB2Zd1mwSMA",
            "reviewer": {
                "profilePhotoUrl": "https://lh6.googleusercontent.com/-aOoz4v2ZCUw/AAAAAAAAAAI/AAAAAAAAAAA/AMZuucnVyugFQjmk3cvqfKtX213THc5qLw/c0x00000000-cc-rp-ba3/photo.jpg",
                "displayName": "Dmitriy Marchenko"
            },
            "starRating": "FOUR",
            "comment": "(Translated by Google) Delicious and inexpensive\n\n(Original)\nВкусно и недорого",
            "createTime": "2019-03-18T06:29:11.441Z",
            "updateTime": "2019-03-18T06:29:11.441Z",
            "reviewReply": {
                "comment": "Спасибо за ваш отзыв!\nПриходите к нам ещё 😀",
                "updateTime": "2019-04-08T07:58:25.007Z"
            },
            "name": "accounts/106941250772149994434/locations/4547712559962801423/reviews/AbFvOqnGJMVHC9ldjkQyv4ku857KmmbRFshTINqBbQBWq7B4rCHE9oTccWFj1dYMoYkQB2Zd1mwSMA"
        },
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
            "reviewId": "AbFvOqkdJQHR0C8pW20-bVnoMX047-5CbGNfu647SOt9646ySdU8fLKnEi8BhnlHpSUwkvjKAy4W",
            "reviewer": {
                "profilePhotoUrl": "https://lh3.googleusercontent.com/a-/AOh14GhYx0GY7R4d-d1TC3aQzinI6islco3leKtVneNgPog=c0x00000000-cc-rp-ba4",
                "displayName": "Надежда Никитина"
            },
            "starRating": "TWO",
            "createTime": "2019-10-22T05:19:48.238Z",
            "updateTime": "2019-10-22T05:19:48.238Z",
            "name": "accounts/106941250772149994434/locations/4547712559962801423/reviews/AbFvOqkdJQHR0C8pW20-bVnoMX047-5CbGNfu647SOt9646ySdU8fLKnEi8BhnlHpSUwkvjKAy4W"
        },
        {
            "reviewId": "AbFvOqnn1yfNoIUWlYY5mbnkKzFktXfFhNvkwFCYHpnATffA_Lk-RJwl9pevX-U3gvRnf2NZrPcRgw",
            "reviewer": {
                "profilePhotoUrl": "https://lh3.googleusercontent.com/a-/AOh14GjTC_Fx99MKzz7mv6MhdEDqn8pFauR9g_cewu1Eog=c0x00000000-cc-rp-ba4",
                "displayName": "Алексей Пожидаев"
            },
            "starRating": "THREE",
            "comment": "(Translated by Google) Inexpensive henkalnaya, with a very mixed quality of food, although there are quite a lot of visitors. From the pros I can highlight quick service. The toilet, to put it mildly, is not very pleasant.\n\n(Original)\nНедорогая хенкальная, с весьма неоднозначным качеством блюд, хотя посетителей довольно много.  Из плюсов могу выделить быстрое обслуживание. В туалете, мягко говоря, не особо приятно.",
            "createTime": "2019-10-18T18:55:52.468Z",
            "updateTime": "2019-10-18T18:55:52.468Z",
            "reviewReply": {
                "comment": "Добрый день Алексей.\nСпасибо вам за отзыв и выраженное мнение.Очень жаль,что не смогли получить от вас самый высокий балл...\nНо мы будем стараться и ждать вновь нашей с вами встречи.Касательно уборной хочется отметить:что своей\"комнаты отдыха\"у нас нет,и принадлежит она ТРЦ Наша Правда.",
                "updateTime": "2019-11-18T04:14:29.563Z"
            },
            "name": "accounts/106941250772149994434/locations/4547712559962801423/reviews/AbFvOqnn1yfNoIUWlYY5mbnkKzFktXfFhNvkwFCYHpnATffA_Lk-RJwl9pevX-U3gvRnf2NZrPcRgw"
        }
    ]
}
""";

//endregion
