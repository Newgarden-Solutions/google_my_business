int starRatingToNumber(String starRating) {
  switch (starRating) {
    case 'ONE': return 1;
    case 'TWO': return 2;
    case 'THREE': return 3;
    case 'FOUR': return 4;
    case 'FIVE': return 5;
    default: return 0;
  }
}

extension MapChecker on Map {
  bool isNullOrEmpty() {
    return this == null || this.isEmpty;
  }
}