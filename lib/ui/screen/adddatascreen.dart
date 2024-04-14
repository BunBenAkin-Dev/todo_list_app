import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list_app/main.dart';
import 'package:todo_list_app/model/data.dart';
import 'package:todo_list_app/provider/to_do_nofiy.dart';
import 'package:todo_list_app/util/Textheader.dart';

class AddNewTask extends ConsumerStatefulWidget {
  const AddNewTask({super.key});

  @override
  ConsumerState<AddNewTask> createState() => _AddNewTaskState();
}

class _AddNewTaskState extends ConsumerState<AddNewTask> {
  DateTime? selcteddate;
  TimeOfDay? selectedTime;
  final formki = GlobalKey<FormState>();

  final wyd = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void saveup() {
      final wydtext = wyd.text;

      if (wydtext.isNotEmpty || selcteddate != null || selectedTime != null) {
        ref.read(todolistnotify.notifier).savetodo(wydtext, selcteddate!);
      }
      Navigator.of(context).pop();
    }

    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: kcolorscheme.primary,
        foregroundColor: Colors.white,
        title: const Text(
          'New Task',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: false,
        actions: [
          IconButton(onPressed: saveup, icon: Icon(CupertinoIcons.check_mark))
        ],
      ),
      body: SafeArea(
          minimum: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: _whatdoyouwanttodo(context)),
    );
  }

  Widget _whatdoyouwanttodo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Texthead(apl: 'Task :'),
        ),
        SizedBox(
          height: 120,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: TextFormField(
                controller: wyd,
                maxLength: 50,
                decoration: const InputDecoration(
                    labelText: 'What do you Want to do ?'),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Texthead(apl: 'Date :'),
        ),
        _tasktimr(context),
        const SizedBox(
          height: 20,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Texthead(apl: 'Time :'),
        ),
        _timey(context),
      ],
    );
  }

  Widget _tasktimr(BuildContext context) {
    void showl() async {
      final now = DateTime.now();

      final firstdate = DateTime(now.year, now.month, now.day);
      final lastDate = DateTime(now.year + 5, now.month, now.day);
      final pickedate = await showDatePicker(
          context: context, firstDate: firstdate, lastDate: lastDate);
      setState(() {
        selcteddate = pickedate;
      });
    }

    return SizedBox(
        height: 90,
        child: InkWell(
          onTap: showl,
          child: Card(
              child: Center(
            child: ListTile(
                title: Text(
                  selcteddate == null
                      ? 'Please Select date'
                      : dateformat.format(selcteddate!),
                  style: const TextStyle(color: CupertinoColors.black),
                ),
                trailing: const Icon(
                  CupertinoIcons.calendar,
                )),
          )),
        ));
  }

  Widget _timey(BuildContext context) {
    void _timer() async {
      const datu = TimeOfDay(hour: 0, minute: 0);
      final picktime =
          await showTimePicker(context: context, initialTime: datu);

      if (picktime != null) {
        setState(() {
          selectedTime = picktime;
        });
      }
    }

    return SizedBox(
      height: 90,
      child: Card(
          child: Center(
        child: ListTile(
          onTap: _timer,
          title: Text(selectedTime == null
              ? 'Please select your time'
              : selectedTime!.format(context)),
          trailing: const Icon(CupertinoIcons.time),
        ),
      )),
    );
  }
}
