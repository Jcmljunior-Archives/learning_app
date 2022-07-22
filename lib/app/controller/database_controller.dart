import 'dart:async';
import 'dart:io';

import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart'
    show
        getApplicationDocumentsDirectory,
        getApplicationSupportDirectory,
        getDownloadsDirectory,
        getExternalCacheDirectories,
        getExternalStorageDirectory,
        getLibraryDirectory,
        getTemporaryDirectory;
import 'package:sqflite_common/sqlite_api.dart'
    show Database, OpenDatabaseOptions;
import 'package:sqflite_common_ffi/sqflite_ffi.dart' show databaseFactoryFfi;

enum DirectoriesType {
  applicationSupport,
  applicationDocuments,
  applicationLibrary,
  temporary,
  externalStorage,
  externalCache,
  downloads,
}

class DatabaseController {
  // Instancia privada de database.
  Database? _database;

  // Construtor privado.
  DatabaseController._();

  // Acesso publico a instancia de database.
  static final DatabaseController getInstance = DatabaseController._();

  // Retorna
  Future<Database?> get database async {
    // Se existir uma instancia anterior, retorne a propria.
    if (_database != null) return _database;

    // Retorna uma nova instancia.
    _database = await _init();

    return _database;
  }

  Future<String> getDirectory(DirectoriesType directory) async {
    late Directory dir;

    switch (directory) {
      case DirectoriesType.temporary:
        dir = await getTemporaryDirectory();
        break;

      case DirectoriesType.applicationSupport:
        dir = await getApplicationSupportDirectory();
        break;

      case DirectoriesType.applicationDocuments:
        dir = await getApplicationDocumentsDirectory();
        break;

      case DirectoriesType.applicationLibrary:
        dir = await getLibraryDirectory();
        break;

      case DirectoriesType.externalStorage:
        dir = getExternalStorageDirectory() as Directory;
        break;

      case DirectoriesType.externalCache:
        dir = getExternalCacheDirectories() as Directory;
        break;

      case DirectoriesType.downloads:
        dir = getDownloadsDirectory() as Directory;
        break;
    }

    return dir.path;
  }

  // Cria uma instancia de dados.
  Future<Database> _init() async {
    return await databaseFactoryFfi.openDatabase(
        join(
          await getDirectory(DirectoriesType.applicationDocuments),
          'learning_app.db',
        ),
        options: OpenDatabaseOptions(
          version: 1,
          onOpen: (db) => {},
          onCreate: _onCreate,
        ));
  }

  // Executa após a criação do banco de dados.
  Future<void> _onCreate(Database db, int version) async {
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
