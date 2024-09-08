import 'package:flutter/material.dart';
import 'package:travelme/models/hotel_model.dart';
import 'package:travelme/models/hotel_room_model.dart';
import 'package:travelme/services/auth_services.dart';
import 'package:travelme/services/hotel_services.dart';

class HotelProvider with ChangeNotifier {
  List<HotelModel> _hotels = [];

  List<HotelModel> get hotels => _hotels;

  set hotels(List<HotelModel> hotels) {
    _hotels = hotels;
    notifyListeners();
  }

  List<HotelRoomModel> _rooms = [];

  List<HotelRoomModel> get rooms => _rooms;

  set rooms(List<HotelRoomModel> rooms) {
    _rooms = rooms;
    notifyListeners();
  }

  AuthServices authServices = AuthServices();

  Future<void> getHotels(String token) async {
    try {
      List<HotelModel> hotels = await HotelServices().getHotels(token);
      print(hotels);
      _hotels = hotels;
    } catch (e) {
      debugPrint('Fetching hotels data error: $e');
    }
  }

  Future<void> getRooms(String token, int hotelId) async {
    try {
      List<HotelRoomModel> rooms =
          await HotelServices().getRooms(token, hotelId);
      _rooms = rooms;
    } catch (e) {
      debugPrint('Fetching rooms data error: $e');
    }
  }

  Future<void> getHotelsByCoordinates(double latitude, double longitude,
      DateTime checkIn, DateTime checkOut) async {
    try {
      List<HotelModel> hotels = await HotelServices()
          .getHotelsByCoordinates(latitude, longitude, checkIn, checkOut);
      print(hotels);
      _hotels = hotels;
    } catch (e) {
      debugPrint('Fetching hotels data error: $e');
    }
  }
}
