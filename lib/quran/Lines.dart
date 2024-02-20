import 'package:flutter/material.dart';

class Verses extends StatelessWidget {
  int index;
  String content;

  Verses(this.index, this.content, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 3),
        child: Text(
          content,
          style: const TextStyle(fontSize: 17),
        ));
  }
}
