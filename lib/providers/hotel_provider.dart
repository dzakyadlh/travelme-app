import 'package:flutter/material.dart';
import 'package:travelme/models/hotel_model.dart';
import 'package:travelme/services/hotel_services.dart';

class HotelProvider with ChangeNotifier {
  List<HotelModel> _hotels = [];

  List<HotelModel> get hotels => _hotels;

  set hotels(List<HotelModel> hotels) {
    _hotels = hotels;
    notifyListeners();
  }

  Future<void> getHotels(String token) async {
    try {
      List<HotelModel> hotels = await HotelServices().getHotels(token);
      _hotels = hotels;
    } catch (e) {
      debugPrint('Fetching hotels data error: $e');
    }
  }
}
