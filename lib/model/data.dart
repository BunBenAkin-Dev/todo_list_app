import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:uuid/uuid.dart';

const uuid = Uuid();
final dateformat = DateFormat.yMMMEd();

DateTime aol = DateTime.now();
final timeformat = TimeOfDay.fromDateTime(aol);

class Tododata {
  String text;
  String id;
  DateTime datey;

  bool ischecked;

  Tododata({
    required this.text,
    required this.datey,
  })  : id = uuid.v4(),
        ischecked = false;

  String get formatteddate {
    return dateformat.format(datey);
  }

  // String get formattedtime {
  //   return timeformat.format(context);
  // }
}
