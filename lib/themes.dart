import 'package:flutter/material.dart';

class MyTheme {
  static Color primary_color = Color(0xFFB7935F);
  static Color w = Colors.white;
  static Color dark = Colors.black45;
  static Color black = Color(0xFF242424);
  static Color white = Colors.white;
  static Color yellow = Colors.amberAccent;

  //static Color dark = Color(0xFF141A2E);
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
        titleSmall: TextStyle(color: Colors.white),
        headlineSmall: TextStyle(color: Colors.black),
        headlineLarge: TextStyle(color: Colors.black, fontSize: 24),
        // titleMedium: TextStyle(),

        // headline1: TextStyle(),
        //headline3: TextStyle(
        //color: dark,
        //  ),
        //   color: Colors.black,
        //   fontWeight: FontWeight.bold,
        // ),
        bodyMedium: TextStyle(color: Colors.black),
        bodyLarge: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ));
  static ThemeData DarkTheme = ThemeData(
      primaryColor: dark,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: dark,
        selectedIconTheme: IconThemeData(color: Colors.amber),
        unselectedIconTheme: IconThemeData(color: Colors.white),
      ),
      textTheme: TextTheme(
        headlineLarge: TextStyle(color: Colors.white, fontSize: 24),
        headlineSmall: TextStyle(color: Colors.white),

        //   color: Colors.black,
        //   fontWeight: FontWeight.bold,
        // ),
        bodyMedium: TextStyle(color: Colors.white),
        bodyLarge: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ));
}
