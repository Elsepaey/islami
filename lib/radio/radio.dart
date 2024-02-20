import 'package:flutter/material.dart';
import 'package:projects/themes.dart';
import 'package:provider/provider.dart';

import '../provider/Setting_Provider.dart';

class radio extends StatelessWidget {
  const radio({super.key});

  @override
  Widget build(BuildContext context) {
    var settingprovider = Provider.of<settingProvider>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        alignment: Alignment.center,
        width: double.infinity,
        child: Column(
          children: [
            const Image(
              image: AssetImage("assets/images/radio_image.png"),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "اذاعه القراّّن الكريم ",
              style: TextStyle(fontSize: 22),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  child: Icon(
                    size: 45,
                    Icons.skip_previous,
                    color: settingprovider.isDarkMode()
                        ? MyTheme.yellow
                        : MyTheme.primary_color,
                  ),
                ),
                InkWell(
                  child: Icon(
                    size: 45,
                    Icons.pause,
                    color: settingprovider.isDarkMode()
                        ? MyTheme.yellow
                        : MyTheme.primary_color,
                  ),
                ),
                InkWell(
                    child: Icon(
                      size: 45,
                  Icons.skip_next,
                  color: settingprovider.isDarkMode()
                      ? MyTheme.yellow
                      : MyTheme.primary_color,
                )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
