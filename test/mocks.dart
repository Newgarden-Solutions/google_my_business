import 'dart:io';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

class GoogleSignInMock extends Mock implements GoogleSignIn {
  @override
  Stream<GoogleSignInAccount> get onCurrentUserChanged =>
      Stream.value(GoogleSignInAccountMock());

  @override
  GoogleSignInAccount get currentUser => GoogleSignInAccountMock();
}

class GoogleSignInAccountMock extends Mock implements GoogleSignInAccount {
  static const TEST_DISPLAY_NAME = "GMB API";

  Future<Map<String, String>> get authHeaders {
    return Future.value(<String, String>{
      "Authorization": "Bearer Token",
      "X-Goog-AuthUser": "0",
      HttpHeaders.contentTypeHeader: "application/json; charset=utf-8"
    });
  }

  @override
  String get displayName => TEST_DISPLAY_NAME;
}

class HttpClientMock extends Mock implements http.Client {}
