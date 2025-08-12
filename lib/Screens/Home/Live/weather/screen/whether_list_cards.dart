// lib/Home/components/whether_list_cards.dart

import 'package:ethio_fm_radio/Screens/Home/Live/weather/models/wether_model.dart';
import 'package:ethio_fm_radio/Screens/Home/Live/weather/cubit/wether_cubit.dart';
import 'package:ethio_fm_radio/Screens/Home/Live/weather/cubit/wether_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WhetherListCards extends StatefulWidget {
  const WhetherListCards({super.key});

  @override
  State<WhetherListCards> createState() => _WhetherListCardsState();
}

class _WhetherListCardsState extends State<WhetherListCards> {
  final List<String> cities = [
    "Addis Ababa",
    "Dire Dawa",
    "Awassa",
    "Gondar",
    "Bahir Dar",
    "Nazret",
    "Asebe Teferi",
    "Hirna",
  ];

  @override
  void initState() {
    super.initState();
    context.read<WeatherCubit>().fetchWeatherForCities(cities);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is WeatherLoaded) {
          final List<WeatherModel> weatherList = state.weatherList;

          return Expanded(
            child: ListView.builder(
              itemCount: weatherList.length,
              itemBuilder: (context, index) {
                final weather = weatherList[index];
                return Card(
                  margin: EdgeInsets.symmetric(
                    vertical: 0.5.h,
                    horizontal: 10.w,
                  ),
                  child: ListTile(
                    tileColor: Colors.white,
                    subtitle: Text(weather.condition),
                    title: Text(
                      weather.cityName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        weather.hasError
                            ? Icon(Icons.error, color: weather.color)
                            : SizedBox(
                                width: 24,
                                height: 24,
                                child: Image.network(
                                  weather.iconUrl,
                                  fit: BoxFit.contain,
                                ),
                              ),
                        SizedBox(width: 6.w),
                        Text(
                          "${weather.temperature}°",
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is WeatherError) {
          return Center(child: Text('Error: ${state.message}'));
        }

        return const Center(child: Text('Enter a city to get weather data.'));
      },
    );
  }
}
