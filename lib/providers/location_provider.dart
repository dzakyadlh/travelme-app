import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:travelme/services/location_services.dart';

class LocationProvider with ChangeNotifier {
  Position _position = Position(
    longitude: 0.0,
    latitude: 0.0,
    timestamp: DateTime.now(),
    accuracy: 0.0,
    altitude: 0.0,
    altitudeAccuracy: 0.0,
    heading: 0.0,
    headingAccuracy: 0.0,
    speed: 0.0,
    speedAccuracy: 0.0,
  );
  Position get position => _position;
  set position(Position position) {
    _position = position;
    notifyListeners();
  }

  String _address = '';
  String get address => _address;
  set address(String address) {
    _address = address;
    notifyListeners();
  }

  Future<bool> requestLocationPermission() async {
    try {
      bool permission = await LocationServices().requestLocationPermission();
      return permission;
    } catch (e) {
      debugPrint('Location permission request failed: $e');
      return false;
    }
  }

  Future<void> getUserPosition() async {
    try {
      Position position = await LocationServices().getUserPosition();
      _position = position;
    } catch (e) {
      debugPrint('Fetching user position error: $e');
    }
  }

  Future<void> getUserAddress(Position position) async {
    try {
      String address = await LocationServices().getUserAddress(position);
      _address = address;
    } catch (e) {
      debugPrint('Fetching user address error: $e');
    }
  }
}
