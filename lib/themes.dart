import 'package:flutter/material.dart';

class MyTheme {
  static Color primary_color = Color(0xFFB7935F);
  static ThemeData LightTheme = ThemeData(
      primaryColor: primary_color,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: primary_color,
        selectedIconTheme: IconThemeData(color: Colors.black),
        unselectedIconTheme: IconThemeData(color: Colors.white),
      ),
      textTheme: TextTheme(
        headline5: TextStyle(),
        headline1: TextStyle(),
        headline3: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ));
}
