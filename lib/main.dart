import 'package:ethio_fm_radio/my_page_view.dart';
import 'package:ethio_fm_radio/theme/theme_data.dart';
import 'package:flutter/material.dart';

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
    return MaterialApp(
      theme: myThemeData,
      debugShowCheckedModeBanner: false,
      home: MyPageView(),
    );
  }
}
