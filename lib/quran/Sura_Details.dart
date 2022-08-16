import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projects/quran/Lines.dart';
import 'package:projects/themes.dart';

class Details extends StatefulWidget {
  static String Route_Name = "sura details";

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  List<String> ayat = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Sura_data;
    if (ayat.isEmpty) {
      readFiles(args.index);
    }

    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/default_bg.png'))),
        child: Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  child: Text(
                    args.title,
                    style: Theme.of(context).textTheme.headline3,
                  )),
              Expanded(
                child: ayat.isEmpty
                    ? CircularProgressIndicator()
                    : Container(
                        margin: EdgeInsets.symmetric(vertical: 15),
                        padding: EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.white),
                        child: ListView.separated(
                            itemBuilder: (context, index) {
                              return Text(
                                "${ayat[index]}{${index + 1}}",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 18),
                              );
                            },
                            itemCount: ayat.length,
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
        ));
  }

  void readFiles(int index) async {
    String content =
        await rootBundle.loadString("assets/files/${index + 1}.txt");
    ayat = content.split("\r\n");
    setState(() {});
  }
}

class Sura_data {
  String title;
  int index;

  Sura_data({required this.index, required this.title});
}
