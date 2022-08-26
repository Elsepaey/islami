import 'package:flutter/material.dart';
import 'package:projects/provider/Setting_Provider.dart';
import 'package:projects/themes.dart';
import 'package:provider/provider.dart';

class Themes_Sheet extends StatefulWidget {
  @override
  State<Themes_Sheet> createState() => _Themes_SheetState();
}

class _Themes_SheetState extends State<Themes_Sheet> {
  @override
  Widget build(BuildContext context) {
    var settingprovider = Provider.of<settingProvider>(context);
    return Container(
      child: Column(
        children: [
          InkWell(
            // dark
            onTap: () {
              settingprovider.changeTheme(ThemeMode.dark);
            },
            child: settingprovider.appTheme == ThemeMode.dark
                ? getSelectedItem('Dark')
                : getUnSelectedItem('Dark'),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            // light
            onTap: () {
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
          style: TextStyle(color: MyTheme.primary_color),
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
            style: TextStyle(
              fontSize: 18,
            ))
      ],
    );
  }
}
