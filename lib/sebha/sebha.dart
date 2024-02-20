import 'package:flutter/material.dart';
import 'dart:math';
import '../provider/Setting_Provider.dart';
import '../themes.dart';
import 'package:provider/provider.dart';

class Sebha extends StatefulWidget {
  const Sebha({super.key});

  @override
  State<Sebha> createState() => _SebhaState();
}

class _SebhaState extends State<Sebha> {
  int counter = 0;
  double angle = 0;

  @override
  Widget build(BuildContext context) {
    var settingprovider = Provider.of<settingProvider>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        alignment: Alignment.center,
        width: double.infinity,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Image(
                image: AssetImage(settingprovider.isDarkMode()
                    ? "assets/images/head_sebha_dark.png"
                    : "assets/images/head_sebha_logo.png"),
              ),
              Container(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.height * 0.07),
                child: Transform.rotate(
                  angle: pi / 180 * angle,
                  child: Image(
                    image: AssetImage(settingprovider.isDarkMode()
                        ? "assets/images/body_sebha_dark.png"
                        : "assets/images/body_sebha_logo.png"),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "عدد التسبيحات",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
              padding: const EdgeInsets.all(10),
              width: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  // border: Border.all(color: MyTheme.primary_color, width: 1),
                  color: const Color(0xffB7935F)),
              child: Text("$counter",
                  style: const TextStyle(color: Colors.black, fontSize: 22))),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              if (counter >= 99) {
                counter = 0;
              } else {
                counter++;
              }

              angle += 200 / 33;
              setState(() {});
            },
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
            child: Text(
              statement(),
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ]),
      ),
    );
  }

  String statement() {
    if (counter >= 0 && counter <= 33) {
      return "سبحان الله";
    } else if (counter >= 34 && counter <= 66) {
      return "الحمد لله";
    } else {
      return "الله اكبر";
    }
  }
}
