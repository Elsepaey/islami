import 'package:flutter/material.dart';

class Verses extends StatelessWidget {
  int index;
  String content;

  Verses(this.index, this.content);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 3),
        child: Text(
          content,
          style: TextStyle(fontSize: 17),
        ));
  }
}
