import 'package:sqflite_common/sqlite_api.dart' show Database;

import '../controller/database_controller.dart';
import '../model/counter_model.dart';

class CounterController {
  Database? db;

  int _length = 0;

  get length => _length;

  // Construtor.
  CounterController() {
    constructor();
  }

  Future<void> constructor() async {
    await _getAllCounter();
  }

  // Lista as informações do contador. (Quantidade de cliques)
  Future<void> _getAllCounter() async {
    db = await DatabaseController.getInstance.database;
    List counter = await db!.query('counter', limit: 1);
    _length = CounterModel.fromMap(counter.first).counter;
  }

  Future<void> setIncrement() async {
    db = await DatabaseController.getInstance.database;
    db!.update(
      'counter',
      {
        'counter': _length++ + 1,
      },
    );
  }

  Future<void> setDecrement() async {
    db = await DatabaseController.getInstance.database;
    db!.update(
      'counter',
      {
        'counter': _length-- - 1,
      },
    );
  }
}
