import 'package:sqflite_common/sqlite_api.dart';
import '../controller/database_controller.dart';

class CounterController {
  Database? db;

  int _length = 0;

  get length => _length;

  // Construtor.
  CounterController() {
    constructor();
  }

  Future<void> constructor() async {
    await _getLength();
  }

  Future<void> _getLength() async {
    db = await DatabaseController.getInstance.database;
    List counter = await db!.query('counter', limit: 1);
    _length = counter[0]['counter'] as int;
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
