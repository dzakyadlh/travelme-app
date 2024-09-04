class HotelGalleryModel {
  List<String> url;

  HotelGalleryModel({
    required this.url,
  });

  HotelGalleryModel.fromJson(Map<String, dynamic> json)
      : url = json['url'] ?? '';

  Map<String, dynamic> toJson() {
    return {
      'url': url,
    };
  }
}
