import 'package:google_sign_in/google_sign_in.dart';
import 'package:mockito/mockito.dart';

class GoogleSignInMock extends Mock implements GoogleSignIn {
  @override
  Stream<GoogleSignInAccount> get onCurrentUserChanged =>
      Stream.value(GoogleSignInAccountMock());
}

class GoogleSignInAccountMock extends Mock implements GoogleSignInAccount {}
