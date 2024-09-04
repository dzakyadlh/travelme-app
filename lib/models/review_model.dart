class ReviewModel {
  String comment;
  double rating;
  String? photoUrl;
  DateTime createdAt;

  ReviewModel({
    required this.comment,
    required this.rating,
    this.photoUrl,
    required this.createdAt,
  });

  ReviewModel.fromJson(Map<String, dynamic> json)
      : comment = json['comment'] ?? '',
        rating = json['rating'] ?? 0.0,
        photoUrl = json['photoUrl'] ?? '',
        createdAt = json['created_at'];

  Map<String, dynamic> toJson() {
    return {
      'comment': comment,
      'rating': rating,
      'photoUrl': photoUrl,
      'created_at': createdAt,
    };
  }
}
