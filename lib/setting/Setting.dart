import 'package:flutter/material.dart';
import 'package:projects/setting/Languages_Buttom_Sheet.dart';
import 'package:projects/setting/themes_Sheet.dart';
import 'package:projects/themes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class setting extends StatefulWidget {
  const setting({super.key});

  static String language = "English";
  static String theme = "Light";

  @override
  State<setting> createState() => _settingState();
}

class _settingState extends State<setting> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 80, horizontal: 10),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(AppLocalizations.of(context)!.language,
              style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              showLanguagesSheet();
            },
            child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border:
                        Border.all(color: MyTheme.primary_color, width: 1.5),
                    color: Colors.white),
                child: Text(setting.language,
                    style: const TextStyle(color: Colors.black, fontSize: 22))),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(AppLocalizations.of(context)!.theme,
              style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              ShowThemesSheet();
            },
            child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border:
                        Border.all(color: MyTheme.primary_color, width: 1.5),
                    color: Colors.white),
                child: Text(setting.theme,
                    style: const TextStyle(color: Colors.black, fontSize: 22))),
          )
        ],
      ),
    );
  }

  void showLanguagesSheet() {
    showModalBottomSheet(
        context: context,
        builder: (buildContext) {
          return const Language_Sheet();
        });
  }

  void ShowThemesSheet() {
    showModalBottomSheet(
        context: context,
        builder: (buildContext) {
          return const Themes_Sheet();
        });
  }
}
