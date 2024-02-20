import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/Setting_Provider.dart';
import '../themes.dart';

class Hadeth_Page extends StatelessWidget {
  static String Route_Name = "hadeth details";

  const Hadeth_Page({super.key});

  @override
  Widget build(BuildContext context) {
    var settingprovider = Provider.of<settingProvider>(context);
    var args = ModalRoute.of(context)?.settings.arguments as Hadeath;
    List<String> lines = args.content.split("\n");
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: settingprovider.isDarkMode()
                  ? const AssetImage('assets/images/dark_bg.png')
                  : const AssetImage('assets/images/default_bg.png'))),
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 32,
                ),
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: settingprovider.isDarkMode()
                      ? MyTheme.black
                      : MyTheme.white,
                ),
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return Text(
                        lines[index],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          color: settingprovider.isDarkMode()
                              ? MyTheme.white
                              : MyTheme.black,
                        ),
                      );
                    },
                    itemCount: lines.length,
                    separatorBuilder: (context, index) {
                      return Container(
                        height: 1,
                        color: MyTheme.primary_color,
                        margin: const EdgeInsets.symmetric(horizontal: 12),
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Hadeath {
  String title;
  String content;

  Hadeath({required this.title, required this.content});
}
