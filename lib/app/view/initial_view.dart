import 'package:flutter/material.dart';

import '../component/appbar_component.dart';
import '../component/loading_component.dart';
import '../component/initial_component.dart';
import '../controller/initial_controller.dart';

class InitialView extends StatefulWidget {
  const InitialView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => InitialViewState();
}

class InitialViewState extends State<InitialView> {
  final InitialController _controller = InitialController();
  String locale = 'pt-br';

  @override
  void initState() {
    super.initState();

    constructor();
  }

  // Retorna o valor de contador para componentes externos.
  get counter => _controller.counter.length;

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
      appBar: const AppBarComponent().build(context),
      body: !_controller.isLoaded
          ? const LoadingComponent()
          : const InitialComponent(),
    );
  }
}
