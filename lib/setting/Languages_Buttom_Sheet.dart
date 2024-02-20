import 'package:flutter/material.dart';
import 'package:projects/provider/Setting_Provider.dart';
import 'package:projects/setting/Setting.dart';
import 'package:projects/themes.dart';
import 'package:provider/provider.dart';

class Language_Sheet extends StatefulWidget {
  const Language_Sheet({super.key});

  @override
  State<Language_Sheet> createState() => _Language_SheetState();
}

class _Language_SheetState extends State<Language_Sheet> {
  @override
  static String selected = "";

  @override
  Widget build(BuildContext context) {
    var settingprovider = Provider.of<settingProvider>(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Column(
        children: [
          InkWell(
              onTap: () {
                setting.language = "English";

                settingprovider.changeLanguage("en");
                selected = "English";
              },
              child: settingprovider.Current_Language == "en"
                  ? getSelectedItem("English")
                  : getUnSelectedItem("English")),
          const SizedBox(
            height: 4,
          ),
          InkWell(
              onTap: () {
                setting.language = "العربيه";
                selected = "العربيه";
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
