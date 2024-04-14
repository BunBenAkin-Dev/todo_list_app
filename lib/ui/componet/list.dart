import 'package:flutter/material.dart';
import 'package:todo_list_app/model/data.dart';
import 'package:todo_list_app/ui/componet/listitem.dart';

class Listtray extends StatelessWidget {
  const Listtray({required this.listy, super.key});

  final List<Tododata> listy;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listy.length,
        itemBuilder: (ctx, index) {
          return listy.isEmpty
              ? _content(context)
              : Itemy(
                  art: listy[index],
                );
        });
  }

  Widget _content(BuildContext context) {
    return const Center(
      child: Text('How May I Help You with Your Schedule'),
    );
  }
}
