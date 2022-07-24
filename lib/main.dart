import 'package:flutter/material.dart';
import 'package:learning_app/app/controller/theme_controller.dart';

import './app/model/locale_model.dart';
import './app/controller/locale_controller.dart';
import './app/controller/bootstrap_controller.dart';
import './app/controller/routes_controller.dart';

void main(List<String> args) {
  runApp(const Bootstrap());
}

// Controle principal.
class Bootstrap extends StatefulWidget {
  const Bootstrap({Key? key}) : super(key: key);

  @override
  State<Bootstrap> createState() => BootstrapState();
}

class BootstrapState extends State<Bootstrap> {
  final BootstrapController _controller = BootstrapController(
    locales: LocaleController(
      locales: [
        LocaleModel(id: 1, lang: 'pt-br'),
        LocaleModel(id: 2, lang: 'en-us'),
      ],
    ),
    routes: RoutesController(
      initialPath: '/',
    ),
    theme: ThemeController(
      selectedColorScheme: 0,
      scheme: BrightnessOptions.brightnessDark,
    ),
  );

  @override
  void initState() {
    super.initState();
  }

  // Atualiza o estado da aplicação.
  handleSetIsLoaded() {
    setState(() {
      _controller.setIsLoaded();
    });
  }

  // Atualiza a rota em atividade.
  Future<void> handleActivePath(String path) async {
    await _controller.routes.setActivePath(path);
    setState(() {});
  }

  get handleGetBrightness => _controller.theme.getBrightness();

  @override
  MaterialApp build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _controller.theme.updateThemes(),
      initialRoute: _controller.routes.initialPath,
      routes: _controller.routes.getAll(),
    );
  }
}
