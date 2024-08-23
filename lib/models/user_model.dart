class UserModel {
  int id;
  String name;
  String email;
  String? photoUrl;
  String? token;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.photoUrl,
    this.token,
  });

  UserModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? 0,
        name = json['name'] ?? '',
        email = json['email'] ?? '',
        photoUrl = json['photo_url'],
        token = json['token'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'photo_url': photoUrl,
      'token': token,
    };
  }
}
