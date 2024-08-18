import 'package:flutter/material.dart';
import 'package:travelme/models/hotel_model.dart';

class HotelProvider with ChangeNotifier {
  List<HotelModel> _hotels = [];

  List<HotelModel> get hotels => _hotels;

  set hotels(List<HotelModel> hotels) {
    _hotels = hotels;
    notifyListeners();
  }

  // Future<void> getHotels()async{
  //   try {
  //     List<HotelModel> hotels = await HotelService().getHotels();
  //     _hotels = hotels;
  //   } catch (e) {
  //     debugPrint('Fetching hotels data error: $e');
  //   }
  // }
}
