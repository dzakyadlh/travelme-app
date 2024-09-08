import 'package:travelme/models/hotel_gallery_model.dart';
import 'package:travelme/models/review_model.dart';

class HotelModel {
  int id;
  String name;
  String location;
  String description;
  double rating;
  List<HotelGalleryModel> gallery;
  List<ReviewModel> reviews;
  DateTime updatedAt;

  HotelModel({
    required this.id,
    required this.name,
    required this.location,
    required this.description,
    required this.rating,
    required this.gallery,
    required this.reviews,
    required this.updatedAt,
  });

  HotelModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        location = json['location'],
        description = json['description'],
        rating = (json['rating'] as num).toDouble(),
        gallery = (json['gallery'] as List)
            .map((item) => HotelGalleryModel.fromJson(item))
            .toList(),
        reviews = (json['reviews'] as List)
            .map((item) => ReviewModel.fromJson(item))
            .toList(),
        updatedAt = DateTime.parse(json['updated_at']);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'location': location,
      'description': description,
      'rating': rating,
      'gallery': gallery.map((e) => e.toJson()).toList(),
      'reviews': reviews,
      'updated_at': updatedAt
    };
  }

  @override
  String toString() {
    return toJson().toString();
  }
}

class UninitializedHotelModel extends HotelModel {
  UninitializedHotelModel()
      : super(
          id: 0,
          name: '',
          location: '',
          description: '',
          rating: 0.0,
          gallery: [],
          reviews: [],
          updatedAt: DateTime.now(),
        );
}
