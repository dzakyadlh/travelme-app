class HotelModel {
  int id;
  String name;
  String location;
  double price;
  String description;
  String rating;
  List<String> gallery;

  HotelModel({
    required this.id,
    required this.name,
    required this.location,
    required this.price,
    required this.description,
    required this.rating,
    required this.gallery,
  });
}
