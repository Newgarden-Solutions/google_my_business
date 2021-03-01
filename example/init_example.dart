import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_my_business/main.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Example extends StatefulWidget {
  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(_currentUser == null ? "Please log in" : _currentUser.displayName),
        RaisedButton(
            child:
                Text(_currentUser == null ? 'Sign in with Google' : 'Sign Out'),
            onPressed: () {
              if (_currentUser == null) {
                // In case you would like to sign in manually
                GoogleMyBusiness.instance.signIn().then((user) {
                  setState(() {
                    _currentUser = user;
                  });
                });
              } else {
                // To sign out current user
                GoogleMyBusiness.instance.signOut();
              }
            })
      ],
    );
  }
}
