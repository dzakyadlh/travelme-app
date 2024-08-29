import 'package:flutter/material.dart';
import 'package:travelme/models/user_model.dart';
import 'package:travelme/services/auth_services.dart';

class AuthProvider with ChangeNotifier {
  UserModel _user = UserModel(id: 0, name: '', email: '');

  UserModel get user => _user;

  set user(UserModel user) {
    _user = user;
    notifyListeners();
  }

  Future<bool> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      UserModel user = await AuthServices()
          .register(name: name, email: email, password: password);
      _user = user;
      return true;
    } catch (e) {
      debugPrint('Error during registration: $e');
      return false;
    }
  }

  Future<bool> login({
    required String email,
    required String password,
  }) async {
    try {
      UserModel user =
          await AuthServices().login(email: email, password: password);
      _user = user;
      return true;
    } catch (e) {
      debugPrint('Error during login: $e');
      return false;
    }
  }

  Future<bool> getUserDataFromStorage() async {
    try {
      UserModel? user = await AuthServices().getUserDataFromStorage();

      // If the user is null, handle the error
      if (user == null) {
        throw Exception("Failed to retrieve user data from storage.");
      }

      _user = user;
      return true;
    } catch (e) {
      debugPrint('Error when fetching user data from storage: $e');
      return false;
    }
  }

  Future<bool> getUserByToken() async {
    try {
      UserModel user = await AuthServices().getUserByToken();
      _user = user;
      return true;
    } catch (e) {
      debugPrint('Error when fetching authenticated user data: $e');
      return false;
    }
  }

  Future<bool> logout() async {
    try {
      bool isLoggedOut = await AuthServices().logout();
      if (isLoggedOut) {
        _user = UserModel(id: 0, name: '', email: '');
        notifyListeners();
      }
      return isLoggedOut;
    } catch (e) {
      debugPrint('Error during logout: $e');
      return false;
    }
  }
}
