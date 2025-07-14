import 'package:ethio_fm_radio/Data/models/wether_model.dart';

abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final List<WeatherData> weatherList;

  WeatherLoaded(this.weatherList);
}

class WeatherError extends WeatherState {
  final String message;

  WeatherError(this.message);
}
