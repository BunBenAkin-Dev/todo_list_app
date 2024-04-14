import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list_app/model/data.dart';
import 'package:todo_list_app/provider/to_do_nofiy.dart';

class Itemy extends ConsumerStatefulWidget {
  const Itemy({required this.art, super.key});

  final Tododata art;

  @override
  ConsumerState<Itemy> createState() => _ItemyState();
}

class _ItemyState extends ConsumerState<Itemy> {
  // void delete_asap(String id) async {
  //   final dels = await ref.read(todolistnotify.notifier).deletedata(id);

  //   return dels;
  // }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Dismissible(
        onDismissed: (direction) {
          //delete_asap(widget.art.id);
        },
        key: ValueKey(widget.art.text),
        child: CheckboxListTile(
            //  key: ValueKey(widget.art.id),
            title: Text(widget.art.text),
            subtitle: Row(
              children: [
                Text(widget.art.formatteddate),
              ],
            ),
            value: widget.art.ischecked,
            onChanged: (newvalue) {
              setState(() {
                widget.art.ischecked = newvalue!;
              });
            }),
      ),
    );
  }
}
