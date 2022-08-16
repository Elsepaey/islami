import 'package:flutter/material.dart';
import 'package:projects/quran/Sura_Details.dart';
import 'package:projects/themes.dart';

import 'home_Screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        Details.Route_Name: (context) => Details(),
      },
      theme: MyTheme.LightTheme,
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
