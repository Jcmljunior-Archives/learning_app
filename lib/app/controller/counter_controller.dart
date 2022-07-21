import 'package:sqflite_common/sqlite_api.dart';

import '../database/db_controller.dart';

class CounterController {
  // instancia do banco.
  Database? db;

  // define o valor inicial do contador.
  int _length = 0;

  get length => _length;

  // Construtor.
  CounterController() {
    initCounter();
  }

  initCounter() async {
    _getLength();
  }

  _setLength(int count) async {
    db = await DBController.db.database;
    db!.update(
      'counter',
      {
        'counter': count,
      },
    );
  }

  _getLength() async {
    db = await DBController.db.database;
    List counter = await db!.query('counter', limit: 1);
    _length = counter[0]['counter'] as int;
  }

  setIncrement() => _setLength(_length++);

  setDecrement() => _setLength(_length--);
}
