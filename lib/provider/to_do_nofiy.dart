import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
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

  Future<List<Tododata>> load() async {
    final db = await _getsqfldatabase();

    final aol = await db.query('To_Do');

    final newdata = aol
        .map((e) => Tododata(
            text: e['text'] as String,
            datey: dateformat.parse(e['datetime'] as String)))
        .toList();

    print(newdata.length);

    state = newdata;
    return newdata;
  }

  void savetodo(String text, DateTime datey) async {
    final newdata = Tododata(text: text, datey: datey);

    final db = await _getsqfldatabase();
    db.insert('To_Do', {
      'id': newdata.id,
      'text': newdata.text,
      'datetime': dateformat.format(newdata.datey),
    });

    state = [newdata, ...state];

    await load();
  }

  Future<void> deletedata(String text) async {
    final db = await _getsqfldatabase();
    final aol = db.delete(
      'To_Do',
      where: 'text  = ?',
      whereArgs: [text],
    );
    await load();
  }
}

final todolistnotify =
    StateNotifierProvider<Todolisty, List<Tododata>>((ref) => Todolisty());
