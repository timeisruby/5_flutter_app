import 'package:flutter/material.dart';
import 'package:movement_app/const/const.dart';
import 'package:movement_app/screen/main_screen.dart';
import 'package:movement_app/screen/root_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: backgroundColor,
        sliderTheme: SliderThemeData(
          thumbColor: primaryColor,
          activeTickMarkColor: primaryColor,
          inactiveTrackColor: primaryColor.withOpacity(0.3),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: primaryColor,
          unselectedItemColor: secondaryColor,
          backgroundColor: backgroundColor,
        ),
      ),
      home: RootScreen(),
    );
  }
}
