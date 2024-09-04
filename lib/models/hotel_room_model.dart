class HotelRoomModel {
  String name;
  double price;
  int size;
  String bed;
  int maxGuests;
  bool isRefundable;

  HotelRoomModel({
    required this.name,
    required this.price,
    required this.size,
    required this.bed,
    required this.maxGuests,
    required this.isRefundable,
  });
}
