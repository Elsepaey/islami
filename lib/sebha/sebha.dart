import 'package:flutter/material.dart';
import 'dart:math';
import '../provider/Setting_Provider.dart';
import '../themes.dart';
import 'package:provider/provider.dart';

class Sebha extends StatefulWidget {
  @override
  State<Sebha> createState() => _SebhaState();
}

class _SebhaState extends State<Sebha> {
  int counter = 0;
  double angle = 15;

  @override
  Widget build(BuildContext context) {
    var settingprovider = Provider.of<settingProvider>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        alignment: Alignment.center,
        width: double.infinity,
        child: Column(children: [
          Image(
            image: AssetImage(settingprovider.isDarkMode()
                ? "assets/images/head_sebha_dark.png"
                : "assets/images/head_sebha_logo.png"),
          ),
          Transform.rotate(
            angle: angle * pi / 180,
            child: Image(
              image: AssetImage(settingprovider.isDarkMode()
                  ? "assets/images/body_sebha_dark.png"
                  : "assets/images/body_sebha_logo.png"),
            ),
          ),
          Text("عدد التسبيحات"),
          Container(
              alignment: Alignment.center,
              width: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: MyTheme.primary_color, width: 1),
                  color: Colors.white),
              child: Text("$counter",
                  style: TextStyle(color: Colors.black, fontSize: 22))),
          ElevatedButton(
            onPressed: () {
              if (counter >= 99) {
                counter = 0;
              } else {
                counter++;
              }

              angle += angle;
              setState(() {});
            },
            child: Text(
              statement(),
              style: TextStyle(color: Colors.black),
            ),
            style: ButtonStyle(
                backgroundColor: MaterialStateColor.resolveWith(
                  (states) => settingprovider.isDarkMode()
                      ? MyTheme.yellow
                      : MyTheme.primary_color,
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ))),
          ),
        ]),
      ),
    );
  }

  String statement() {
    if (this.counter >= 0 && this.counter <= 33) {
      return "سبحان الله";
    } else if (this.counter >= 34 && this.counter <= 66) {
      return "الحمد لله";
    } else {
      return "الله اكبر";
    }
  }
}
