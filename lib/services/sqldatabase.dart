import 'package:path/path.dart' as path;

import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';
import 'package:todo_list_app/model/data.dart';

Future<Database> _getsqfldatabase() async {
  final dbpath = await sql.getDatabasesPath();

  final db = await sql.openDatabase(
    path.join(dbpath, 'To_Do_Database.db'),
    onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE To_Do (id INTEGER PRIMARY KEY, name TEXT, value INTEGER, num REAL)');
    },
    version: 1,
  );
  return db;
}

Future<List<Tododata>> load() async {
  final db = await _getsqfldatabase();

  final aol = await db.query('To_Do');

  final newdata = aol
      .map((e) => Tododata(
          text: e['text'] as String,
          datey: dateformat.parse(e['datetime'] as String)))
      .toList();

  print(newdata.length);

  return newdata;
}
