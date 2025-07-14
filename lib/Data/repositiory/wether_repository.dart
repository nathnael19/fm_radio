import 'dart:convert';
import 'package:ethio_fm_radio/Data/models/wether_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WeatherRepository {
  final String _apiKey =
      'b3d14a6241584bcc8e9121326250907'; // Put your WeatherAPI.com key here

  Future<List<WeatherData>> fetchWeatherForCities(List<String> cities) async {
    List<WeatherData> weatherList = [];

    for (String city in cities) {
      final url = Uri.parse(
        'http://api.weatherapi.com/v1/current.json?key=$_apiKey&q=$city',
      );

      try {
        final response = await http.get(url);

        if (response.statusCode == 200) {
          final data = json.decode(response.body);
          final cityName = data['location']['name'];
          final temp = (data['current']['temp_c'] as num).toDouble();
          final condition = data['current']['condition']['text'];
          final icon = "https:" + data['current']['condition']['icon'];

          weatherList.add(
            WeatherData(
              cityName: cityName,
              iconUrl: icon,
              temperature: temp,
              color: Colors.blue,
              condition: condition,
              hasError: false,
            ),
          );
        } else {
          weatherList.add(
            WeatherData(
              cityName: city,
              iconUrl: '',
              temperature: 0,
              color: Colors.red,
              condition: 'Error fetching data',
              hasError: true,
            ),
          );
        }
      } catch (e) {
        weatherList.add(
          WeatherData(
            cityName: city,
            iconUrl: '',
            temperature: 0,
            color: Colors.red,
            condition: 'Network error',
            hasError: true,
          ),
        );
      }
    }

    return weatherList;
  }
}
