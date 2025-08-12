// lib/cubit/weather/weather_cubit.dart

import 'package:ethio_fm_radio/Screens/Home/Live/weather/models/wether_repository.dart';
import 'package:ethio_fm_radio/Screens/Home/Live/weather/cubit/wether_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherCubit(this.weatherRepository) : super(WeatherInitial());

  Future<void> fetchWeatherForCities(List<String> cities) async {
    emit(WeatherLoading());

    try {
      final weatherList = await weatherRepository.fetchWeatherForCities(cities);
      emit(WeatherLoaded(weatherList));
    } catch (e) {
      emit(WeatherError(e.toString()));
    }
  }
}
