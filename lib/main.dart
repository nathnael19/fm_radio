import 'package:ethio_fm_radio/Screens/Auth/signin_page.dart';
import 'package:ethio_fm_radio/cubit/audio/audio_cubit.dart';
import 'package:ethio_fm_radio/cubit/first_time/first_time_cubit.dart';
import 'package:ethio_fm_radio/cubit/notification/notification_cubit.dart';
import 'package:ethio_fm_radio/my_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ethio_fm_radio/l10n/app_localizations.dart';
import 'package:ethio_fm_radio/theme/theme_data.dart';

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
        BlocProvider(create: (_) => AudioCubit())
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, Locale>(
      builder: (context, locale) {
        return ScreenUtilInit(
          designSize: const Size(390, 844),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
              theme: myThemeData,
              debugShowCheckedModeBanner: false,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              locale: locale,
              home: FirstTime(),
            );
          },
        );
      },
    );
  }
}

class FirstTime extends StatelessWidget {
  const FirstTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<FirstTimeCubit, LaunchState>(
        builder: (context, state) {
          if (state is LaunchLoading) {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state is NotFirstLaunch) {
            return SigninPage();
          } else {
            return MyPageView();
          }
        },
      ),
    );
  }
}
