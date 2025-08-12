// lib/data/models/weather_data.dart
import 'package:flutter/material.dart';

class WeatherModel {
  final String cityName;
  final String iconUrl;
  final double temperature;
  final Color color;
  final String condition;
  final bool hasError;

  WeatherModel({
    required this.cityName,
    required this.iconUrl,
    required this.temperature,
    required this.color,
    required this.condition,
    this.hasError = false,
  });
}
