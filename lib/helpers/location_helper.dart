import 'package:geolocator/geolocator.dart';

class LocationHelper {
  //Todo:tobe changed
  static Future<Position> detremineUserCurrentLocation() async {
    bool isServiceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!isServiceEnabled) {
      //request from user to open gps

      await Geolocator.requestPermission();
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }
}
