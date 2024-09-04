import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:travelme/models/hotel_model.dart';
import 'package:http/http.dart' as http;

class HotelServices {
  String baseUrl = 'http://10.0.2.2:8000/api';

  Future<List<HotelModel>> getHotels(String token) async {
    var url = Uri.parse('$baseUrl/hotels');

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };

    var response = await http.get(
      url,
      headers: headers,
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      List<HotelModel> hotels = HotelModel.fromJson(data['data']);
      return hotels;
    } else {
      var errorData = jsonDecode(response.body);
      var errorMessage = errorData['message'] ?? 'Fetching hotel data failed';
      throw Exception('Fetch data failed: $errorMessage');
    }
  }
}
