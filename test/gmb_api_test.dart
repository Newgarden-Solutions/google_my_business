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
  });
}
