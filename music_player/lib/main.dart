import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Screens/splashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Music Player',
      home: const SplashScreen(),
      theme: ThemeData(
          fontFamily: "regular",
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.transparent, elevation: 0)),
    );
  }
}
