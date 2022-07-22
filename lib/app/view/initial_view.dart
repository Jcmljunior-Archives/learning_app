import 'package:flutter/material.dart';

import '../controller/initial_controller.dart';

class InitialView extends StatefulWidget {
  const InitialView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => InitialViewState();
}

class InitialViewState extends State<InitialView> {
  final InitialController _controller = InitialController();

  @override
  void initState() {
    super.initState();

    constructor();
  }

  Future<void> constructor() async {
    await _controller.counter.constructor();
    setState(() {
      _controller.isLoaded = true;
    });
  }

  void handleSetIncrement() {
    setState(() {
      _controller.counter.setIncrement();
    });
  }

  void handleSetDecrement() {
    setState(() {
      _controller.counter.setDecrement();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: !_controller.isLoaded
          ? const Center(
              child: Text('Loading...'),
            )
          : SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text('Você pressionou esse botão tantas vezes:'),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        '${_controller.counter.length}',
                        style: const TextStyle(
                          fontSize: 24,
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton.icon(
                        onPressed: () {
                          handleSetIncrement();
                        },
                        icon: const Icon(Icons.add),
                        label: const Text('Incrementar'),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      ElevatedButton.icon(
                        onPressed: _controller.counter.length as int >= 1
                            ? () {
                                handleSetDecrement();
                              }
                            : null,
                        icon: const Icon(Icons.remove),
                        label: const Text('Decrementar'),
                      ),
                    ],
                  )
                ],
              ),
            ),
    );
  }
}
