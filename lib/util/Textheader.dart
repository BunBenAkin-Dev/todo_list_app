import 'package:flutter/material.dart';
import 'package:todo_list_app/main.dart';

class Texthead extends StatelessWidget {
  const Texthead({required this.apl, super.key});

  final String apl;

  @override
  Widget build(BuildContext context) {
    return Text(apl,
        style: TextStyle(fontSize: 20, color: kcolorscheme.primary));
  }
}
