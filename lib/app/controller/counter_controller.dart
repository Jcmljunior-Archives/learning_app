// ignore: depend_on_referenced_packages
import 'package:sqflite_common/sqlite_api.dart';

import '../model/counter_model.dart';
import 'database_controller.dart';

class CounterController {
  Database? db;

  int counter;

  CounterController({
    required this.counter,
  });

  Future<void> updateCounter() async {
    db = await DatabaseController.getInstance.database;
    List count = await db!.query('counter', limit: 1);
    counter = CounterModel.fromMap(count.first).counter;
  }

  Future<void> increment() async => {
        db = await DatabaseController.getInstance.database,
        db!.update(
          'counter',
          {
            'counter': counter++ + 1,
          },
        ),
      };

  Future<void> decrement() async => {
        db = await DatabaseController.getInstance.database,
        db!.update(
          'counter',
          {
            'counter': counter-- - 1,
          },
        ),
      };
}
