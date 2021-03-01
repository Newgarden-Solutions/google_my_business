import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_my_business/main.dart';
import 'locations.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GoogleSignInAccount _currentUser;

  @override
  void initState() {
    super.initState();

    GoogleMyBusiness.instance.init((user) {
      setState(() {
        _currentUser = user;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Google My Business Demo'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(_currentUser == null
                  ? "Please log in"
                  : _currentUser.displayName),
              RaisedButton(
                  child: Text(_currentUser == null
                      ? 'Sign in with Google'
                      : 'Sign Out'),
                  onPressed: () {
                    if (_currentUser == null) {
                      // In case you would like to sign in manually
                      GoogleMyBusiness.instance.signIn().then((user) {
                        setState(() {
                          _currentUser = user;

                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Locations()));
                          // Use other API, open a new page or whatever
                          // to access user, use GoogleMyBusiness.instance.currentUser()
                        });
                      });
                    } else {
                      // To sign out current user
                      GoogleMyBusiness.instance.signOut();
                    }
                  })
            ],
          ),
        ));
  }
}
