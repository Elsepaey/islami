import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Hadeth extends StatefulWidget {
  @override
  State<Hadeth> createState() => _HadethState();
}

class _HadethState extends State<Hadeth> {
  @override
  List<Hadeath> Hadeath_List = [];

  Widget build(BuildContext context) {
    if (Hadeath_List.isEmpty) {
      readfiles();
    }
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Text(
                Hadeath_List[index].title,
                style: TextStyle(color: Colors.black),
              );
            },
            itemCount: Hadeath_List.length,
          ),
        )
      ],
    );
  }

  void readfiles() async {
    String data = await rootBundle.loadString("assets/files/ahadeth.txt");
    List<String> allContent = data.trim().split("#");
    for (int i = 0; i < allContent.length; i++) {
      List<String> hadeath_content = allContent[i].split("\n");
      String Title = hadeath_content[0];
      hadeath_content.removeAt(0);
      Hadeath H = Hadeath(Title, hadeath_content);
      Hadeath_List.add(H);
    }
    setState(() {});
  }
}

class Hadeath {
  String title;
  List<String> content;

  Hadeath(this.title, this.content);
}
