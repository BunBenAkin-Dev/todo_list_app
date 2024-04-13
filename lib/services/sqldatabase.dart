import 'package:path/path.dart' as path;

import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';

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
