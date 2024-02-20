import 'package:flutter/material.dart';
import 'package:projects/provider/Setting_Provider.dart';
import 'package:projects/setting/Setting.dart';
import 'package:projects/themes.dart';
import 'package:provider/provider.dart';

class Themes_Sheet extends StatefulWidget {
  const Themes_Sheet({super.key});

  @override
  State<Themes_Sheet> createState() => _Themes_SheetState();
}

class _Themes_SheetState extends State<Themes_Sheet> {
  @override
  Widget build(BuildContext context) {
    var settingprovider = Provider.of<settingProvider>(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Column(
        children: [
          InkWell(
            // dark
            onTap: () {
              setting.theme = "Dark";

              settingprovider.changeTheme(ThemeMode.dark);
            },
            child: settingprovider.appTheme == ThemeMode.dark
                ? getSelectedItem('Dark')
                : getUnSelectedItem('Dark'),
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            // light
            onTap: () {
              setting.theme = "Light";
              settingprovider.changeTheme(ThemeMode.light);
            },
            child: settingprovider.appTheme == ThemeMode.light
                ? getSelectedItem('Light')
                : getUnSelectedItem('Light'),
          ),
        ],
      ),
    );
  }

  Widget getSelectedItem(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(
              color: MyTheme.primary_color,
              fontSize: 20,
              fontWeight: FontWeight.w600),
        ),
        Icon(
          Icons.check,
          color: MyTheme.primary_color,
        )
      ],
    );
  }

  Widget getUnSelectedItem(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
            ))
      ],
    );
  }
}
