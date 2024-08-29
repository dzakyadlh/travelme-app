import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:travelme/models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthServices {
  String baseUrl = 'http://10.0.2.2:8000/api';

  final _storage = const FlutterSecureStorage();

  Future<void> saveUserLoginData(UserModel user) async {
    await _storage.write(key: 'id', value: user.id.toString());
    await _storage.write(key: 'name', value: user.name);
    await _storage.write(key: 'email', value: user.email);
    await _storage.write(key: 'auth_token', value: user.token);
    await _storage.write(key: 'photoUrl', value: user.photoUrl ?? '');
  }

  Future<String?> getToken() async {
    return await _storage.read(key: 'auth_token');
  }

  Future<UserModel?> getUserDataFromStorage() async {
    String? id = await _storage.read(key: 'id');
    String? name = await _storage.read(key: 'name');
    String? email = await _storage.read(key: 'email');
    String? token = await _storage.read(key: 'auth_token');
    String? photoUrl = await _storage.read(key: 'photoUrl');

    // Return `null` if any of the required fields are missing
    if (id == null || name == null || email == null || token == null) {
      return null;
    }

    return UserModel(
      id: int.tryParse(id) ?? 0, // Default to 0 if parsing fails
      name: name,
      email: email,
      token: token,
      photoUrl:
          photoUrl ?? '', // Default to an empty string if `photoUrl` is null
    );
  }

  Future<void> clearToken() async {
    await _storage.delete(key: 'id');
    await _storage.delete(key: 'name');
    await _storage.delete(key: 'email');
    await _storage.delete(key: 'auth_token');
    await _storage.delete(key: 'photoUrl');
  }

  Future<UserModel> register({
    required String name,
    required String email,
    required String password,
  }) async {
    var url = Uri.parse('$baseUrl/register');
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'name': name,
      'email': email,
      'password': password,
    });

    var response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'Bearer ${data['access_token']}';
      saveUserLoginData(user);
      return user;
    } else {
      var errorData = jsonDecode(response.body);
      var errorMessage = errorData['message'] ?? 'Register failed';
      throw Exception('Register failed: $errorMessage');
    }
  }

  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    var url = Uri.parse('$baseUrl/login');
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'email': email,
      'password': password,
    });

    var response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'Bearer ${data['access_token']}';
      saveUserLoginData(user);
      return user;
    } else {
      var errorData = jsonDecode(response.body);
      var errorMessage = errorData['message'] ?? 'Login failed';
      throw Exception('Login failed: $errorMessage');
    }
  }

  Future<UserModel> getUserByToken() async {
    var url = Uri.parse('$baseUrl/getUserByToken');
    var token = await getToken();
    if (token == null) {
      throw Exception('No token found');
    }
    var headers = {
      'Content-Type': 'application/json',
      'Authorizaion': token,
    };

    var response = await http.post(
      url,
      headers: headers,
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      return user;
    } else {
      var errorData = jsonDecode(response.body);
      var errorMessage = errorData['message'] ?? 'Logout failed';
      throw Exception('Logout failed: $errorMessage');
    }
  }

  Future<bool> logout() async {
    var url = Uri.parse('$baseUrl/logout');
    var token = await getToken();
    if (token == null) {
      throw Exception('No token found');
    }
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };

    var response = await http.post(
      url,
      headers: headers,
    );

    if (response.statusCode == 200) {
      await clearToken();
      return true;
    } else {
      var errorData = jsonDecode(response.body);
      var errorMessage = errorData['message'] ?? 'Logout failed';
      throw Exception('Logout failed: $errorMessage');
    }
  }
}
