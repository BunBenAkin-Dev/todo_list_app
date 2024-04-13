import 'package:flutter/material.dart';
import 'package:todo_list_app/main.dart';
import 'package:todo_list_app/model/data.dart';
import 'package:todo_list_app/util/Textheader.dart';

class AddNewTask extends StatefulWidget {
  const AddNewTask({super.key});

  @override
  State<AddNewTask> createState() => _AddNewTaskState();
}

class _AddNewTaskState extends State<AddNewTask> {
  DateTime? selcteddate;
  @override
  Widget build(BuildContext context) {
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
        const Texthead(apl: 'Task : '),
        SizedBox(
          height: 120,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: TextFormField(
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
        const Texthead(apl: 'Date: '),
        _tasktimr(context),
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
              child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text(selcteddate == null
                    ? 'Please Select date'
                    : dateformat.format(selcteddate!)),
              ),
            ],
          )),
        ));
  }
}
