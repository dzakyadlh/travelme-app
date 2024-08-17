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
}
