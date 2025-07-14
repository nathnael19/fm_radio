import 'package:ethio_fm_radio/Data/repositiory/wether_repository.dart';
import 'package:ethio_fm_radio/bottom_navigation.dart';
import 'package:ethio_fm_radio/cubit/wether/wether_cubit.dart';
import 'package:ethio_fm_radio/l10n/app_localizations.dart';
import 'package:ethio_fm_radio/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load saved language before runApp
  final prefs = await SharedPreferences.getInstance();
  String? langCode = prefs.getString('selectedLanguage');
  Locale initialLocale = Locale(langCode ?? 'am'); // default to Amharic

  runApp(MyApp(initialLocale: initialLocale));
}

class MyApp extends StatefulWidget {
  final Locale initialLocale;

  const MyApp({super.key, required this.initialLocale});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Locale _locale;

  @override
  void initState() {
    super.initState();
    _locale = widget.initialLocale;
  }

  void _setLocale(Locale locale) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedLanguage', locale.languageCode);
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<WeatherCubit>(
              create: (_) => WeatherCubit(WeatherRepository()),
            ),
            // You can add more cubits here later
          ],
          child: MaterialApp(
            theme: myThemeData,
            debugShowCheckedModeBanner: false,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: _locale,
            home: MyBottomNavigation(onLocaleChange: _setLocale),
          ),
        );
      },
    );
  }
}
