import 'dart:convert';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class LocationServices {

  Future<bool> requestLocationPermission() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // You can prompt the user to enable location services.
      return false;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle this scenario (e.g., show a dialog to guide the user to settings)
      return false;
    }

    return true;
  }

  Future<Position> getUserPosition() async {
    final hasPermission = await requestLocationPermission();
    if (hasPermission) {
      return await Geolocator.getCurrentPosition();
    } else {
      throw Exception('Location permission denied or services are disabled.');
    }
  }

  Future<String> getUserAddress(Position position) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          position.latitude, position.longitude);
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        String currentAddress =
            '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
        return currentAddress;
      } else {
        throw Exception('No address available for the given coordinates');
      }
    } catch (e) {
      throw Exception('Error occurred while getting address: $e');
    }
  }

  Future<String> getLocationId(String name) async {
    var url = Uri.parse(
        'https://booking-com15.p.rapidapi.com/api/v1/hotels/query?searchDestination=$name');

    var headers = {
      'x-rapidapi-host': 'booking-com15.p.rapidapi.com',
      'x-rapidapi-key': '5f86fd7d25msh82389c264fed047p12a461jsn31581c0b17f1',
    };

    var response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      String locationId = data[0]['dest_id'];
      return locationId;
    } else {
      var errorData = jsonDecode(response.body);
      var errorMessage = errorData['message'] ?? 'Fetching location id failed';
      throw Exception('Fetch location id failed: $errorMessage');
    }
  }
}
