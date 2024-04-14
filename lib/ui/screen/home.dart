import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list_app/model/data.dart';

import 'package:todo_list_app/provider/to_do_nofiy.dart';
import 'package:todo_list_app/services/sqldatabase.dart';

import 'package:todo_list_app/ui/componet/list.dart';
import 'package:todo_list_app/ui/screen/adddatascreen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final loadout = ref.read(todolistnotify.notifier).load();

    void addnewtaskscreen() async {
      Navigator.of(context).push<Tododata>(
          MaterialPageRoute(builder: (ctx) => const AddNewTask()));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do List'),
        centerTitle: false,
      ),
      body: LayoutBuilder(builder: (context, orientation) {
        return SafeArea(
            child: FutureBuilder(
                future: load(),
                builder: (ctx, snapshot) {
                  final listy = snapshot.data;
                  return snapshot.hasData
                      ? Listtray(listy: listy!)
                      : const Center(
                          child: CircularProgressIndicator(),
                        );
                }));
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: addnewtaskscreen,
        child: const Icon(Icons.add),
      ),
    );
  }
}
