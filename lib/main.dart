import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:projects/hadeth/hadethContent.dart';
import 'package:projects/provider/Setting_Provider.dart';
import 'package:projects/quran/Sura_Details.dart';
import 'package:projects/themes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import 'home_Screen.dart';

void main() {
  runApp(ChangeNotifierProvider<settingProvider>(
      create: (buildContext) {
        return settingProvider();
      },
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    var SettingProvider = Provider.of<settingProvider>(context);
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(SettingProvider.Current_Language),
      // English, no country code

      routes: {
        Details.Route_Name: (context) => Details(),
        Hadeth_Page.Route_Name: (context) => Hadeth_Page(),
      },
      theme: MyTheme.LightTheme,
      darkTheme: MyTheme.DarkTheme,
      themeMode: SettingProvider.appTheme,
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
