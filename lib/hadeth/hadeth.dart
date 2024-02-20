import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../provider/Setting_Provider.dart';
import 'hadethContent.dart';

class Hadeth extends StatefulWidget {
  const Hadeth({super.key});

  @override
  State<Hadeth> createState() => _HadethState();
}

class _HadethState extends State<Hadeth> {
  @override
  List<Hadeath> All = [];

  @override
  Widget build(BuildContext context) {
    var settingprovider = Provider.of<settingProvider>(context);
    if (All.isEmpty) {
      readfiles();
    }

    return Column(
      children: [
        const Image(image: AssetImage("assets/images/hadeth_logo.png")),
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
                  margin: const EdgeInsets.all(1),
                  child: Text(
                    Localizations.localeOf(context).toString() == "en"
                        ? "Hadeth Number${index + 1}"
                        : All[index].title,
                    style: Theme.of(context).textTheme.headlineLarge,
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
    List<Hadeath> hadeathList = [];
    for (int i = 0; i < allContent.length; i++) {
      List<String> hadeathContent = allContent[i].split('\n');
      String Title = hadeathContent[0];
      hadeathContent.removeAt(0);
      String content = hadeathContent.join('\n');

      Hadeath h = Hadeath(title: Title, content: content);
      hadeathList.add(h);
    }
    All = hadeathList;
    // for(int i=0;i<All.length; i++){
    //   print(All[i].content);
    // }
    setState(() {});
  }
}
