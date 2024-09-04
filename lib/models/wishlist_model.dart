import 'package:travelme/models/hotel_model.dart';

class WishlistModel {
  List<HotelModel> wishlist;

  WishlistModel({
    required this.wishlist,
  });

  WishlistModel.fromJson(Map<String, dynamic> json)
      : wishlist = json['hotel'] ?? 0;

  Map<String, dynamic> toJson() {
    return {
      'hotel': wishlist,
    };
  }
}
