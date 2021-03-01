import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:google_my_business/src/gmb_api.dart';
import 'package:mockito/mockito.dart';

import 'mocks.dart';

void main() {
  setUp(() {
    // Default values
    GMBAPI.instance.googleSignIn = GoogleSignInMock();

    // Default behavior
    when(GMBAPI.instance.googleSignIn.signInSilently())
        .thenAnswer((_) => Future.value(GoogleSignInAccountMock()));
  });

  group('GMB API', () {
    test('[init] should not login when signInSilently = false', () {
      GMBAPI.instance.init((account) => {}, signInSilently: false);

      verifyNever(GMBAPI.instance.googleSignIn.signInSilently());
    });

    test('Init should login when signInSilently = true', () {
      GMBAPI.instance.init((account) => {}, signInSilently: true);

      verify(GMBAPI.instance.googleSignIn.signInSilently()).called(1);
    });

    test('[init] should not crash when callback is null', () {
      GMBAPI.instance.init(null);
    });

    test('[signIn] should sign in and user should be returned', () async {
      when(GMBAPI.instance.googleSignIn.signIn()).thenAnswer((_) => Future.value(GoogleSignInAccountMock()));
      final user = await GMBAPI.instance.signIn();
      expect(user.displayName, GoogleSignInAccountMock.TEST_DISPLAY_NAME);
    });

    test('[signIn] should not sign in when error and user should be null', () async {
      when(GMBAPI.instance.googleSignIn.signIn()).thenThrow(Exception());
      final user = await GMBAPI.instance.signIn();
      expect(user, isNull);
    });

    test('[signOut] should sign out and return current user', () async {
      when(GMBAPI.instance.googleSignIn.signOut()).thenAnswer((_) => Future.value(GoogleSignInAccountMock()));
      final user = await GMBAPI.instance.signOut();
      expect(user.displayName, GoogleSignInAccountMock.TEST_DISPLAY_NAME);
    });
  });
}
