import 'package:flutter/material.dart';
import 'package:todo_list_app/ui/screen/adddatascreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void addnewtaskscreen() {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (ctx) => const AddNewTask()));
    }

    return Scaffold(
      appBar: AppBar(),
      body: LayoutBuilder(builder: (context, orientation) {
        return SafeArea(child: Text(''));
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: addnewtaskscreen,
        child: const Icon(Icons.add),
      ),
    );
  }
}
