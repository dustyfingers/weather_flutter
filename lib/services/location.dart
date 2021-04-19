import 'package:geolocator/geolocator.dart';

class Location {
  double lat = 0.00;
  double long = 0.00;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low,
          forceAndroidLocationManager: true);
      lat = position.latitude;
      long = position.longitude;
    } catch (err) {
      print(err);
    }
  }
}
