import 'package:ethio_fm_radio/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ethio_fm_radio/my_page_view.dart';
import 'package:ethio_fm_radio/theme/theme_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          theme: myThemeData,
          debugShowCheckedModeBanner: false,
          home: child,
        );
      },
      child: const MyBottomNavigation(),
    );
  }
}
