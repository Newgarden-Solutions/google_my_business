import 'package:google_sign_in/google_sign_in.dart';

/// Main entry point.
/// Use this class to get current user or sign in / out with Google Sign In.
class GMBAPI {
  GMBAPI._privateConstructor();

  static final GMBAPI instance = GMBAPI._privateConstructor();

  static final GoogleSignIn googleSignIn = GoogleSignIn.standard(
    scopes: [
      'https://www.googleapis.com/auth/business.manage',
    ],
  );

  /// Initializes connection with Google through Google Sign In
  ///
  /// @funParameter onCurrentUserChangedCallback([GoogleSignInAccount] account) - callback triggered when user is logged in or logged out
  /// @funParameter signInSilently - if true - signs in user with Google silently on the background, otherwise does nothing
  void init(Function(GoogleSignInAccount account) onCurrentUserChangedCallback,
      {bool signInSilently = true}) {
    googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
      onCurrentUserChangedCallback(account);
    });

    if (signInSilently) {
      googleSignIn.signInSilently();
    }
  }

  /// Authenticates using Google Sign In
  Future<void> signIn() async {
    try {
      await googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  /// Logs out current user
  Future<void> signOut() => googleSignIn.disconnect();

  /// Returns current user as [GoogleSignInAccount]
  GoogleSignInAccount currentUser() {
    return googleSignIn.currentUser;
  }
}
