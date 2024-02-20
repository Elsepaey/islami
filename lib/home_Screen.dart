import 'package:flutter/material.dart';
import 'package:projects/hadeth/hadeth.dart';
import 'package:projects/provider/Setting_Provider.dart';
import 'package:projects/quran/quran.dart';
import 'package:projects/radio/radio.dart';
import 'package:projects/sebha/sebha.dart';
import 'package:projects/setting/Setting.dart';
import 'package:projects/themes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var settingprovider = Provider.of<settingProvider>(context);
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: settingprovider.isDarkMode()
                    ? const AssetImage('assets/images/dark_bg.png')
                    : const AssetImage('assets/images/default_bg.png'))),
        child: Scaffold(
          appBar: AppBar(
            title: Center(
                child: Text(
              AppLocalizations.of(context)!.title,
              //style: Theme.of(context).textTheme.headlineLarge,
            )),
          ),
          backgroundColor: Colors.transparent,
          bottomNavigationBar: Theme(
            data: settingprovider.isDarkMode()
                ? Theme.of(context).copyWith(canvasColor: MyTheme.dark)
                : Theme.of(context)
                    .copyWith(canvasColor: MyTheme.primary_color),
            child: BottomNavigationBar(
                currentIndex: selectedIndex,
                onTap: (index) {
                  selectedIndex = index;
                  setState(() {});
                },
                items: [
                  BottomNavigationBarItem(
                      backgroundColor: Theme.of(context)
                          .bottomNavigationBarTheme
                          .backgroundColor,
                      icon: const ImageIcon(
                        AssetImage(
                          'assets/images/icon_quran.png',
                        ),
                      ),
                      label: AppLocalizations.of(context)!.quran),
                  BottomNavigationBarItem(
                      backgroundColor: Theme.of(context)
                          .bottomNavigationBarTheme
                          .backgroundColor,
                      icon: const ImageIcon(
                        AssetImage(
                          'assets/images/icon_hadeth.png',
                        ),
                      ),
                      label: AppLocalizations.of(context)!.hadeth),
                  BottomNavigationBarItem(
                      backgroundColor: Theme.of(context)
                          .bottomNavigationBarTheme
                          .backgroundColor,
                      icon: const ImageIcon(
                        AssetImage(
                          'assets/images/icon_sebha.png',
                        ),
                      ),
                      label: AppLocalizations.of(context)!.sebha),
                  BottomNavigationBarItem(
                      backgroundColor: Theme.of(context)
                          .bottomNavigationBarTheme
                          .backgroundColor,
                      icon: const ImageIcon(
                        AssetImage(
                          'assets/images/icon_radio.png',
                        ),
                      ),
                      label: AppLocalizations.of(context)!.radio),
                  BottomNavigationBarItem(
                      backgroundColor: Theme.of(context)
                          .bottomNavigationBarTheme
                          .backgroundColor,
                      icon: const Icon(Icons.settings),
                      label: AppLocalizations.of(context)!.setting)
                ]),
          ),
          body: pages[selectedIndex],
        ));
  }

  List<Widget> pages = [
    QuranPage(),
    const Hadeth(),
    const Sebha(),
    const radio(),
    const setting()
  ];
}
