import 'dart:convert';

import 'package:travelme/models/hotel_model.dart';
import 'package:http/http.dart' as http;
import 'package:travelme/models/hotel_room_model.dart';

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
      var data = jsonDecode(response.body)['data']['data'];
      List<HotelModel> hotels = [];

      for (var item in data) {
        hotels.add(HotelModel.fromJson(item));
      }

      return hotels;
    } else {
      var errorData = jsonDecode(response.body);
      var errorMessage = errorData['message'] ?? 'Fetching hotel data failed';
      throw Exception('Fetch data failed: $errorMessage');
    }
  }

  Future<List<HotelRoomModel>> getRooms(String token, int hotelId) async {
    var url = Uri.parse('$baseUrl/hotels/rooms?hotel_id=$hotelId');

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };

    var response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data']['data'];
      List<HotelRoomModel> rooms = [];

      for (var item in data) {
        rooms.add(HotelRoomModel.fromJson(item));
      }

      return rooms;
    } else {
      var errorData = jsonDecode(response.body);
      var errorMessage = errorData['message'] ?? 'Fetching room data failed';
      throw Exception('Fetch data failed: $errorMessage');
    }
  }

  var publicApiUrl = 'https://booking-com15.p.rapidapi.com/api/v1/hotels';

  Future<List<HotelModel>> getHotelsByCoordinates(double latitude,
      double longitude, DateTime checkIn, DateTime checkOut) async {
    var url = Uri.parse(
        '$publicApiUrl/searchHotelsByCoordinates?latitude=$latitude&longitude=$longitude.85841985686734&adults=1&arrival_date=${checkIn.year}-${checkIn.month.toString().padLeft(2, '0')}-${checkIn.day.toString().padLeft(2, '0')}&departure_date=${checkOut.year}-${checkOut.month.toString().padLeft(2, '0')}-${checkOut.day.toString().padLeft(2, '0')}&children_age=0%2C17&room_qty=1&units=metric&page_number=1&temperature_unit=c&languagecode=en-us&currency_code=EUR');
    var headers = {
      'x-rapidapi-host': 'booking-com15.p.rapidapi.com',
      'x-rapidapi-key': '5f86fd7d25msh82389c264fed047p12a461jsn31581c0b17f1',
    };

    var response = await http.get(
      url,
      headers: headers,
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data']['hotels'];
      List<HotelModel> hotels = [];

      for (var item in data) {
        hotels.add(HotelModel.fromJson(item));
      }

      return hotels;
    } else {
      var errorData = jsonDecode(response.body);
      var errorMessage = errorData['message'] ?? 'Fetching hotel data failed';
      throw Exception('Fetch hotel data failed: $errorMessage');
    }
  }
}
