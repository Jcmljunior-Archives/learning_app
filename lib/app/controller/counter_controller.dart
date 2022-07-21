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
    // Atualiza o contador com base no banco de dados.
    initCounter();
  }

  initCounter() async {
    await _getLength();
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

  setIncrement() {
    int count = _length++;
    _setLength(count);
  }

  setDecrement() {
    int count = _length >= 1 ? _length++ : _length;
    _setLength(count);
  }
}


// class CounterController {
  // late Database db;

  // int _length = 0;

  // int get length => _length;

  // CounterController() {
  // _initCounter();
  // }

  // _initCounter() async {
  //   await _getLength();
  // }

  // getLength() async {
  //   db = (await DBController.db.database)!;
  //   List counter = await db.query('counter', limit: 1);
  //   _length = counter.first['counter'] as int;
  // }

  // void setIncrement() async {
  //   db = (await DBController.db.database)!;
  //   db.update(
  //     'counter',
  //     {
  //       'counter': _length++,
  //     },
  //   );
  // }

  // void setDecrement() async {
  //   final count = _length >= 1 ? _length++ : _length;

  //   db = (await DBController.db.database)!;
  //   db.update(
  //     'counter',
  //     {
  //       'counter': count,
  //     },
  //   );
  // }
// }
