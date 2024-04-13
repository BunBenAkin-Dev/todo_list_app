import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list_app/model/data.dart';
import 'package:path/path.dart' as path;

import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';

Future<Database> _getsqfldatabase() async {
  final dbpath = await sql.getDatabasesPath();

  final db = await sql.openDatabase(
    path.join(dbpath, 'To_Do_Database.db'),
    onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE To_Do (id TEXT PRIMARY KEY, text TEXT, datetime TEXT)');
    },
    version: 1,
  );
  return db;
}

class Todolisty extends StateNotifier<List<Tododata>> {
  Todolisty() : super([]);

  void savetodo(String id, String text, DateTime datey) async {
    final newdata = Tododata(text: text, datey: datey);

    final db = await _getsqfldatabase();
    db.insert('To_Do', {
      'id': newdata.id,
      'text': newdata.text,
      'datey': dateformat.format(newdata.datey),
    });

    state = [newdata, ...state];
  }
}

final todolistnotify =
    StateNotifierProvider<Todolisty, List<Tododata>>((ref) => Todolisty());
