import 'package:flutter/material.dart';
import 'package:projects/provider/Setting_Provider.dart';
import 'package:projects/themes.dart';
import 'package:provider/provider.dart';

class Language_Sheet extends StatefulWidget {
  @override
  State<Language_Sheet> createState() => _Language_SheetState();
}

class _Language_SheetState extends State<Language_Sheet> {
  @override
  Widget build(BuildContext context) {
    var settingprovider = Provider.of<settingProvider>(context);
    return Container(
      child: Column(
        children: [
          InkWell(
              onTap: () {
                settingprovider.changeLanguage("en");
              },
              child: settingprovider.Current_Language == "en"
                  ? getSelectedItem("English")
                  : getUnSelectedItem("English")),
          SizedBox(
            height: 4,
          ),
          InkWell(
              onTap: () {
                settingprovider.changeLanguage("ar");
              },
              child: settingprovider.Current_Language == "ar"
                  ? getSelectedItem("العربيه")
                  : getUnSelectedItem("العربيه"))
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
              color: Colors.black,
              fontSize: 18,
            ))
      ],
    );
  }
}
