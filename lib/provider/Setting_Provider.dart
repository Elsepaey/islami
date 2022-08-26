import 'package:flutter/material.dart';

class settingProvider extends ChangeNotifier {
  String Current_Language = "en";
  ThemeMode appTheme = ThemeMode.light;

  void changeLanguage(String newLanguage) {
    if (Current_Language == newLanguage) {
      return;
    }
    Current_Language = newLanguage;
    notifyListeners();
  }

  void changeTheme(ThemeMode newMode) {
    if (appTheme == newMode) {
      return;
    }
    appTheme = newMode;
    notifyListeners();
  }

  bool isDarkMode() {
    if (appTheme == ThemeMode.dark) {
      return true;
    } else {
      return false;
    }
  }
}
