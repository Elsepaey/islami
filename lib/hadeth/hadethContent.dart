import 'package:flutter/material.dart';

import '../themes.dart';

class Hadeth_Page extends StatelessWidget {
  static String Route_Name = "hadeth details";

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Hadeath;
    List<String> lines = args.content.split("\n");
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/images/default_bg.png'))),
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(
                  vertical: 32,
                ),
                padding: EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white),
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return Text(
                        lines[index],
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18),
                      );
                    },
                    itemCount: lines.length,
                    separatorBuilder: (context, index) {
                      return Container(
                        height: 1,
                        color: MyTheme.primary_color,
                        margin: EdgeInsets.symmetric(horizontal: 12),
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
