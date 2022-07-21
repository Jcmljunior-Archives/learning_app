import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite_common/sqlite_api.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DBController {
  Database? _database;

  // Construtor privado.
  DBController._();

  static final DBController db = DBController._();

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initDB();

    return _database;
  }

  Future<Database> _initDB() async {
    sqfliteFfiInit();

    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'learning_app.db');

    return await databaseFactoryFfi.openDatabase(
      path,
      options: OpenDatabaseOptions(
        version: 1,
        onOpen: (db) => {},
        onCreate: _onCreate,
      ),
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(_counter);
    await db.insert(
      'counter',
      {
        'counter': 0,
      },
    );
  }

  String get _counter => '''
    CREATE TABLE Counter (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      counter INTEGER
    );
  ''';
}
