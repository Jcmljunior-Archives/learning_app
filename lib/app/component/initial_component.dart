import 'package:flutter/material.dart';

import '../view/initial_view.dart';

class InitialComponent extends StatelessWidget {
  const InitialComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                '${context.findAncestorStateOfType<InitialViewState>()?.counter}',
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
                  context
                      .findAncestorStateOfType<InitialViewState>()
                      ?.handleSetIncrement();
                },
                icon: const Icon(Icons.add),
                label: const Text('Incrementar'),
              ),
              const SizedBox(
                width: 12,
              ),
              ElevatedButton.icon(
                onPressed: context
                            .findAncestorStateOfType<InitialViewState>()
                            ?.counter >=
                        1
                    ? () {
                        context
                            .findAncestorStateOfType<InitialViewState>()
                            ?.handleSetDecrement();
                      }
                    : null,
                icon: const Icon(Icons.remove),
                label: const Text('Decrementar'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
