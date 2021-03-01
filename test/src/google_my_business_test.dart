import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:google_my_business/src/google_my_business.dart';
import 'package:mockito/mockito.dart';

import '../mocks.dart';

void main() {
  setUp(() {
    // Default values
    GoogleMyBusiness.instance.googleSignIn = GoogleSignInMock();

    // Default behavior
    when(GoogleMyBusiness.instance.googleSignIn.signInSilently())
        .thenAnswer((_) => Future.value(GoogleSignInAccountMock()));
  });

  group('Google My Business', () {
    test('[init] should not login when signInSilently = false', () {
      GoogleMyBusiness.instance.init((account) => {}, signInSilently: false);

      verifyNever(GoogleMyBusiness.instance.googleSignIn.signInSilently());
    });

    test('Init should login when signInSilently = true', () {
      GoogleMyBusiness.instance.init((account) => {}, signInSilently: true);

      verify(GoogleMyBusiness.instance.googleSignIn.signInSilently()).called(1);
    });

    test('[init] should not crash when callback is null', () {
      GoogleMyBusiness.instance.init(null);
    });

    test('[signIn] should sign in and user should be returned', () async {
      when(GoogleMyBusiness.instance.googleSignIn.signIn())
          .thenAnswer((_) => Future.value(GoogleSignInAccountMock()));
      final user = await GoogleMyBusiness.instance.signIn();
      expect(user.displayName, GoogleSignInAccountMock.TEST_DISPLAY_NAME);
    });

    test('[signIn] should not sign in when error and user should be null',
        () async {
      when(GoogleMyBusiness.instance.googleSignIn.signIn())
          .thenThrow(Exception());
      final user = await GoogleMyBusiness.instance.signIn();
      expect(user, isNull);
    });

    test('[signOut] should sign out and return current user', () async {
      when(GoogleMyBusiness.instance.googleSignIn.signOut())
          .thenAnswer((_) => Future.value(GoogleSignInAccountMock()));
      final user = await GoogleMyBusiness.instance.signOut();
      expect(user.displayName, GoogleSignInAccountMock.TEST_DISPLAY_NAME);
    });
  });
}
