import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'hadethContent.dart';

class Hadeth extends StatefulWidget {
  @override
  State<Hadeth> createState() => _HadethState();
}

class _HadethState extends State<Hadeth> {
  @override
  List<Hadeath> All = [];

  Widget build(BuildContext context) {
    if (All.isEmpty) {
      readfiles();
    }

    return Column(
      children: [
        Image(image: AssetImage("assets/images/hadeth_logo.png")),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(Hadeth_Page.Route_Name,
                      arguments: Hadeath(
                          title: All[index].title,
                          content: All[index].content));
                },
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(1),
                  child: Text(
                    All[index].title,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
              );
            },
            itemCount: All.length,
          ),
        )
      ],
    );
  }

  void readfiles() async {
    String data = await rootBundle.loadString("assets/files/ahadeth.txt");
    List<String> allContent = data.trim().split("#");
    List<Hadeath> Hadeath_List = [];
    for (int i = 0; i < allContent.length; i++) {
      List<String> hadeath_content = allContent[i].split('\n');
      String Title = hadeath_content[0];
      hadeath_content.removeAt(0);
      String content = hadeath_content.join('\n');

      Hadeath h = Hadeath(title: Title, content: content);
      Hadeath_List.add(h);
    }
    All = Hadeath_List;
    // for(int i=0;i<All.length; i++){
    //   print(All[i].content);
    // }
    setState(() {});
  }
}
