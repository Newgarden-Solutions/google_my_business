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
