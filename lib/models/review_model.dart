class ReviewModel {
  String comment;
  double rating;
  String? photoUrl;

  ReviewModel({
    required this.comment,
    required this.rating,
    this.photoUrl,
  });
}
