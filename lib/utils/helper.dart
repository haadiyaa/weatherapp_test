import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class Helper {
  Future<String?> getLocationName(Position? position)async{
    if (position!=null) {
      try {
        final placemark= await placemarkFromCoordinates(position.latitude, position.longitude);
        if (placemark.isNotEmpty) {
          print(placemark[0].locality);
          return placemark[0].locality;
        } 
      } catch (e) {
        print('Error fetching loc name : $e');
      }
    }
    return null;
  }
}