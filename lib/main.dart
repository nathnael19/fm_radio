import 'package:ethio_fm_radio/Screens/Home/News/cubit/news_cubit.dart';
import 'package:ethio_fm_radio/Screens/main/my_app.dart';
import 'package:ethio_fm_radio/cubit/bottomNavbar/bottom_nav_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ethio_fm_radio/cubit/audio/audio_cubit.dart';
import 'package:ethio_fm_radio/cubit/first_time/first_time_cubit.dart';
import 'package:ethio_fm_radio/cubit/login/login_cubit.dart';
import 'package:ethio_fm_radio/cubit/notification/notification_cubit.dart';
import 'package:ethio_fm_radio/cubit/language/language_cubit.dart';
import 'package:ethio_fm_radio/cubit/wether/wether_cubit.dart';
import 'package:ethio_fm_radio/Data/repositiory/wether_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final initialLocale = await LanguageCubit.loadSavedLocale();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LanguageCubit(initialLocale)),
        BlocProvider(create: (_) => WeatherCubit(WeatherRepository())),
        BlocProvider(create: (_) => NotificationCubit()),
        BlocProvider(create: (_) => FirstTimeCubit()..checkFirstLaunch()),
        BlocProvider(create: (_) => AudioCubit()),
        BlocProvider(create: (_) => LoginCubit()),
        BlocProvider(create: (_) => BottomNavCubit()),
        BlocProvider(create: (_) => NewsCubit()..loadNews()),
      ],
      child: const MyApp(),
    ),
  );
}
