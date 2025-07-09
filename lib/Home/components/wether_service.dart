import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<List<dynamic>>> fetchWeatherForCities(List<String> cities) async {
  const String apiKey =
      "b3d14a6241584bcc8e9121326250907"; // Replace with your WeatherAPI key
  List<List<dynamic>> tempList = [];

  for (String city in cities) {
    final url = Uri.parse(
      'http://api.weatherapi.com/v1/current.json?key=$apiKey&q=$city',
    );

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        String cityName = data['location']['name'];
        double temp = data['current']['temp_c'];
        String condition = data['current']['condition']['text'];

        tempList.add([cityName, Icons.wb_cloudy, temp, Colors.blue, condition]);
      } else {
        tempList.add([city, Icons.error, 0, Colors.red, 'Error']);
      }
    } catch (e) {
      tempList.add([city, Icons.error, 0, Colors.red, 'Network error']);
    }
  }

  return tempList;
}
