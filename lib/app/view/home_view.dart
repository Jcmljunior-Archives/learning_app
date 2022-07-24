import 'package:flutter/material.dart';
import 'package:learning_app/main.dart';

import '../controller/counter_controller.dart';
import '../controller/home_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    super.key,
  });

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeController _controller = HomeController(
    counter: CounterController(
      counter: 0,
    ),
  );

  @override
  void initState() {
    super.initState();

    context.findAncestorStateOfType<BootstrapState>()?.handleActivePath('/');

    handleUpdateCounter();
  }

  Future<void> handleUpdateCounter() async {
    await _controller.counter.updateCounter();
    setState(() {});
  }

  handleIncrement() {
    setState(() {
      _controller.counter.increment();
    });
  }

  handleDecrement() {
    setState(() {
      _controller.counter.decrement();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learning App'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('Você pressionou esse botão tantas vezes:'),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  '${_controller.counter.counter}',
                  style: const TextStyle(
                    fontSize: 24,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () => handleIncrement(),
                      child: const Text('Incrementar'),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    ElevatedButton(
                      onPressed: () => handleDecrement(),
                      child: const Text('Decrementar'),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
