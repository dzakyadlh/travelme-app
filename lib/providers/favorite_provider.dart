import 'package:flutter/material.dart';
import 'package:travelme/models/hotel_model.dart';

class FavoriteProvider with ChangeNotifier {
  List<HotelModel> _favorites = [];
  List<HotelModel> get favorites => _favorites;

  set favorites(List<HotelModel> favorites) {
    _favorites = favorites;
    notifyListeners();
  }

  isFavorited(HotelModel hotel) {
    if (_favorites.indexWhere((e) => e.id == hotel.id) == -1) {
      return false;
    } else {
      return true;
    }
  }
}
