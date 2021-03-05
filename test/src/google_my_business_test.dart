import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:google_my_business/src/google_my_business.dart';
import 'package:mockito/mockito.dart';

import '../stubs.mocks.dart';
import '../stubs.dart';

void main() {
  late MockGoogleSignIn mockGoogleSignIn;
  late MockGoogleSignInAccount mockGoogleSignInAccount;

  setUp(() {
    // Default values
    mockGoogleSignIn = MockGoogleSignIn();
    mockGoogleSignInAccount = MockGoogleSignInAccount();

    GoogleMyBusiness.instance.googleSignIn = mockGoogleSignIn;

    // Default behavior
    when(mockGoogleSignIn.onCurrentUserChanged)
        .thenAnswer((_) => Stream.value(mockGoogleSignInAccount));
    when(mockGoogleSignIn.signInSilently())
        .thenAnswer((_) => Future.value(mockGoogleSignInAccount));
    when(mockGoogleSignIn.currentUser).thenReturn(mockGoogleSignInAccount);
    when(mockGoogleSignInAccount.displayName).thenReturn(TEST_DISPLAY_NAME);
  });

  group('Google My Business', () {
    test('[init] should not login when signInSilently = false', () {
      GoogleMyBusiness.instance.init((account) => {}, signInSilently: false);
      verifyNever(GoogleMyBusiness.instance.googleSignIn.signInSilently());
    });

    test('[init] should login when signInSilently = true', () {
      GoogleMyBusiness.instance.init((account) => {}, signInSilently: true);

      verify(GoogleMyBusiness.instance.googleSignIn.signInSilently()).called(1);
    });

    test('[init] should not crash when callback is null', () {
      GoogleMyBusiness.instance.init((account) => null);
    });

    test('[signIn] should sign in and user should be returned', () async {
      when(GoogleMyBusiness.instance.googleSignIn.signIn())
          .thenAnswer((_) => Future.value(mockGoogleSignInAccount));
      final user = await GoogleMyBusiness.instance.signIn();
      expect(user, isNotNull);
      expect(user?.displayName, TEST_DISPLAY_NAME);
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
          .thenAnswer((_) => Future.value(mockGoogleSignInAccount));
      final user = await GoogleMyBusiness.instance.signOut();
      expect(user, isNotNull);
      expect(user?.displayName, TEST_DISPLAY_NAME);
    });
  });
}
