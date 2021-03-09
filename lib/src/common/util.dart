extension MapChecker on Map? {
  bool isNullOrEmpty() {
    return this == null || this!.isEmpty;
  }
}
