import 'package:flutter/material.dart';
import 'package:projects/hadeth/hadeth.dart';
import 'package:projects/quran/quran.dart';
import 'package:projects/radio/radio.dart';
import 'package:projects/sebha/sebha.dart';
import 'package:projects/themes.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  int selectedIndex = 0;

  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/default_bg.png'))),
        child: Scaffold(
          appBar: AppBar(
            title: Center(
                child: Text(
              'islami',
              style: TextStyle(color: Colors.black, fontSize: 24),
            )),
          ),
          backgroundColor: Colors.transparent,
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: MyTheme.primary_color,
            ),
            child: BottomNavigationBar(
              backgroundColor: MyTheme.primary_color,
              currentIndex: selectedIndex,
              onTap: (index) {
                selectedIndex = index;
                setState(() {});
              },
              items: [
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage(
                        'assets/images/icon_quran.png',
                      ),
                    ),
                    label: 'Quran'),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage(
                        'assets/images/icon_hadeth.png',
                      ),
                    ),
                    label: 'Hadeth'),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage(
                        'assets/images/icon_radio.png',
                      ),
                    ),
                    label: 'Radio'),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage(
                        'assets/images/icon_sebha.png',
                      ),
                    ),
                    label: 'Sebha')
              ],
            ),
          ),
          body: pages[selectedIndex],
        ));
  }

  List<Widget> pages = [Quran(), Hadeth(), radio(), Sebha()];
}
