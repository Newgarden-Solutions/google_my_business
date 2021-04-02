extension MapChecker on Map? {
  bool isNullOrEmpty() {
    return this == null || this!.isEmpty;
  }
}

class Constants {
  static const String VERSION = "v1";

  /// Basic URL for accounts endpoint
  static const String BASE_URL = "https://mybusinessaccountmanagement.googleapis.com/$VERSION";
}