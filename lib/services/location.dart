import 'package:geolocator/geolocator.dart';

class Location {
  Future<Position> getCurrentLocation() async {
    try {
      Position location = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      return location;
    } catch (e) {
      print(e);
    }
  }
}
