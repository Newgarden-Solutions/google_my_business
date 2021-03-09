import 'dart:io';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';

@GenerateMocks([GoogleSignIn, GoogleSignInAccount, http.Client])
const TEST_DISPLAY_NAME = "GMB API";

final mockAuthHeaders = Future.value(<String, String>{
  "Authorization": "Bearer Token",
  "X-Goog-AuthUser": "0",
  HttpHeaders.contentTypeHeader: "application/json; charset=utf-8"
});

final testErrorJson = """
{
    "error": {
        "code": 401,
        "message": "Request had invalid authentication credentials. Expected OAuth 2 access token, login cookie or other valid authentication credential. See https://developers.google.com/identity/sign-in/web/devconsole-project.",
        "status": "UNAUTHENTICATED"
    }
}
""";
