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

  HotelRoomModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        price = json['price'],
        size = json['size'],
        bed = json['bed'],
        maxGuests = json['max_guests'],
        isRefundable = json['is_refundable'];

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'size': size,
      'bed': bed,
      'max_guests': maxGuests,
      'is_refundable': isRefundable,
    };
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
