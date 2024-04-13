import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list_app/ui/screen/home.dart';

final kcolorscheme = ColorScheme.fromSeed(seedColor: Colors.blue);

void main() {
  runApp(ProviderScope(
      child: MaterialApp(
    theme: ThemeData().copyWith(colorScheme: kcolorscheme),
    home: const HomeScreen(),
  )));
}
