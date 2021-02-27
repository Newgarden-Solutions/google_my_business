import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:google_my_business/src/gmb_api.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mockito/mockito.dart';

void main() {
  group('GMB API', () {
    test('[init] should not login when signInSilently = false', () {
      GMBAPI.instance.googleSignIn = GoogleSignInMock();
      when(GMBAPI.instance.googleSignIn.signInSilently())
          .thenAnswer((_) => Future.value(GoogleSignInAccountMock()));

      GMBAPI.instance.init((account) => {}, signInSilently: false);

      verifyNever(GMBAPI.instance.googleSignIn.signInSilently());
    });

    test('Init should login when signInSilently = true', () {
      GMBAPI.instance.googleSignIn = GoogleSignInMock();
      when(GMBAPI.instance.googleSignIn.signInSilently())
          .thenAnswer((_) => Future.value(GoogleSignInAccountMock()));

      GMBAPI.instance.init((account) => {}, signInSilently: true);

      verify(GMBAPI.instance.googleSignIn.signInSilently()).called(1);
    });

    test('[init] should not crash when callback is null', () {
      GMBAPI.instance.googleSignIn = GoogleSignInMock();

      GMBAPI.instance.init(null);
    });
  });
}

//region Mocks

class GoogleSignInMock extends Mock implements GoogleSignIn {
  @override
  Stream<GoogleSignInAccount> get onCurrentUserChanged =>
      Stream.value(GoogleSignInAccountMock());
}

class GoogleSignInAccountMock extends Mock implements GoogleSignInAccount {}

//endregion
