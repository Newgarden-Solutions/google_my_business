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
  Future<Map<String, String>> get authHeaders {
    return Future.value(<String, String>{
      "Authorization": "Bearer Token",
      "X-Goog-AuthUser": "0",
      HttpHeaders.contentTypeHeader: "application/json; charset=utf-8"
    });
  }
}

class HttpClientMock extends Mock implements http.Client {}
