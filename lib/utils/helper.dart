import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';

class Helper {
  Future<String?> getLocationName(Position? position) async {
    if (position != null) {
      try {
        final placemark = await placemarkFromCoordinates(
            position.latitude, position.longitude);
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

  String formatTo12Hour(String dateTimeString) {
    // Parse the input string to DateTime object
    DateTime dateTime = DateTime.parse(dateTimeString);

    // Format DateTime to 12-hour time format
    String formattedTime = DateFormat('hh:mm a').format(dateTime);

    return formattedTime;
  }
}
