# Google My Business for Flutter

[![Coverage](https://codecov.io/gh/Newgarden-Solutions/google_my_business/branch/master/graph/badge.svg?token=YI6PTZN97A)](https://codecov.io/gh/Newgarden-Solutions/google_my_business)
[![Build](https://github.com/Newgarden-Solutions/google_my_business/workflows/build/badge.svg)](https://github.com/Newgarden-Solutions/google_my_business/actions/workflows/build.yml)

Flutter package to work with Google My Business API. 
Simplifies communication & interaction with GMB API endpoints.

More info on GMB API at [Google My Business](https://developers.google.com/my-business)

## Getting Started

### Authentication

Uses a Flutter plugin [Google Sign In](https://pub.dev/packages/google_sign_in) for authentication.

### API

Supported endpoints:

* [Locations](https://developers.google.com/my-business/reference/rest/v4/accounts.locations)
* [Reviews](https://developers.google.com/my-business/reference/rest/v4/accounts.locations.reviews)

### Examples

Example simple app can be found at [/examples](https://github.com/Newgarden-Solutions/google_my_business/tree/master/example)

#### Login

Init (subscribes for user changes, e.g. user signed in / signed out):

```dart
GoogleMyBusiness.instance.init((user) {
  setState(() {
    _currentUser = user;
  });
});
```

In case you would like to sign in manually:

```dart
GoogleMyBusiness.instance.signIn().then((user) {
  setState(() {
    _currentUser = user;

    // Use other API, open a new page or whatever
    // to access user, use GoogleMyBusiness.instance.currentUser()
  });
});
```

To sign out current user:

```dart
GoogleMyBusiness.instance.signOut();
```

#### Locations

Retrieve locations:

```dart
_locationsManager = LocationsManager(accountId: "my-account-id");

// ...

await _locationsManager.fetchLocations((locations) async {
  print("Total locations: ${locations.length}");

  setState(() {
    _locations = locations;
    _isLoading = false;
  });
}, (error) {
  print('Google My Business API: ${error.code} - ${error.message}');
  setState(() {
    _isLoading = false;
  });
});
```
