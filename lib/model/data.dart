import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();
final dateformat = DateFormat.yMEd();

class Tododata {
  String text;
  String id;
  DateTime datey;

  Tododata({required this.text, required this.datey}) : id = uuid.v4();

  String get formatteddate {
    return dateformat.format(datey);
  }
}
