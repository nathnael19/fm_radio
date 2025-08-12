import 'package:ethio_fm_radio/Screens/Home/Live/weather/models/wether_model.dart';

abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final List<WeatherModel> weatherList;

  WeatherLoaded(this.weatherList);
}

class WeatherError extends WeatherState {
  final String message;

  WeatherError(this.message);
}
