import 'package:flutter/material.dart';
import 'package:projects/setting/Languages_Buttom_Sheet.dart';
import 'package:projects/setting/themes_Sheet.dart';
import 'package:projects/themes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class setting extends StatefulWidget {
  @override
  State<setting> createState() => _settingState();
}

class _settingState extends State<setting> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(AppLocalizations.of(context)!.language,
              style: Theme.of(context).textTheme.headline5),
          InkWell(
            onTap: () {
              ShowLanguagesSheet();
            },
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: MyTheme.primary_color, width: 1),
                    color: Colors.white),
                child: Text("English", style: TextStyle(fontSize: 22))),
          ),
          SizedBox(
            height: 10,
          ),
          Text(AppLocalizations.of(context)!.theme,
              style: Theme.of(context).textTheme.headline5),
          InkWell(
            onTap: () {
              ShowThemesSheet();
            },
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: MyTheme.primary_color, width: 1),
                    color: Colors.white),
                child: Text("Light", style: TextStyle(fontSize: 22))),
          )
        ],
      ),
    );
  }

  void ShowLanguagesSheet() {
    showModalBottomSheet(
        context: context,
        builder: (buildContext) {
          return Language_Sheet();
        });
  }

  void ShowThemesSheet() {
    showModalBottomSheet(
        context: context,
        builder: (buildContext) {
          return Themes_Sheet();
        });
  }
}
