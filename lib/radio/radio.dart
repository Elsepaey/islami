import 'package:flutter/material.dart';
import 'package:projects/themes.dart';
import 'package:provider/provider.dart';

import '../provider/Setting_Provider.dart';

class radio extends StatelessWidget {
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
            Image(
              image: AssetImage("assets/images/radio_image.png"),
            ),
            Text("اذاعه القراّّن الكريم "),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  child: Icon(
                    Icons.skip_previous,
                    color: settingprovider.isDarkMode()
                        ? MyTheme.yellow
                        : MyTheme.primary_color,
                  ),
                ),
                InkWell(
                  child: Icon(
                    Icons.pause,
                    color: settingprovider.isDarkMode()
                        ? MyTheme.yellow
                        : MyTheme.primary_color,
                  ),
                ),
                InkWell(
                    child: Icon(
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
