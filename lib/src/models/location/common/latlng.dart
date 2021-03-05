/// An object that represents a latitude/longitude pair.
/// This is expressed as a pair of doubles to represent degrees latitude and degrees longitude.
/// Unless specified otherwise, this must conform to the [http://www.unoosa.org/pdf/icg/2012/template/WGS_84.pdf](WGS84 standard).
/// Values must be within normalized ranges.
class LatLng {
  final num? latitude;
  final num? longitude;

  LatLng(this.latitude, this.longitude);

  LatLng.fromJson(Map<String, dynamic> json)
      : latitude = json["latitude"],
        longitude = json["longitude"];
}
