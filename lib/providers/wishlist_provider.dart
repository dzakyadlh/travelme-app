import 'package:flutter/material.dart';
import 'package:travelme/models/hotel_model.dart';

class WishlistProvider with ChangeNotifier {
  List<HotelModel> _wishlist = [];
  List<HotelModel> get wishlist => _wishlist;

  String baseUrl = 'http://10.0.2.2:8000/api';

  set wishlist(List<HotelModel> wishlist) {
    _wishlist = wishlist;
    notifyListeners();
  }

  setHotel(HotelModel hotel) {
    if (!isWishlisted(hotel)) {
      _wishlist.add(hotel);
    } else {
      _wishlist.removeWhere((e) => e.id == hotel.id);
    }
    notifyListeners();
  }

  isWishlisted(HotelModel hotel) {
    if (_wishlist.indexWhere((e) => e.id == hotel.id) == -1) {
      return false;
    } else {
      return true;
    }
  }
}
