import 'package:travelme/models/hotel_gallery_model.dart';
import 'package:travelme/models/review_model.dart';

class HotelModel {
  int id;
  String name;
  String location;
  String description;
  double rating;
  HotelGalleryModel gallery;
  List<ReviewModel> reviews;

  HotelModel({
    required this.id,
    required this.name,
    required this.location,
    required this.description,
    required this.rating,
    required this.gallery,
    required this.reviews,
  });
}
