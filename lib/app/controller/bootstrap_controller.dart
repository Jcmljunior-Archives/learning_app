import 'package:learning_app/app/controller/theme_controller.dart';

import 'locale_controller.dart';
import 'routes_controller.dart';

class BootstrapController {
  final RoutesController routes;
  final LocaleController locales;
  final ThemeController theme;

  final bool _isLoaded = false;

  BootstrapController({
    required this.locales,
    required this.routes,
    required this.theme,
  });

  // Atualiza o estado da variavél privada: isLoaded.
  // Define se esta ou não em processo de carregamento de dados.
  // Utilizado para exibir ou ocultar elementos em seus respectivo processo.
  // Variavel global refere-se a dados globais.
  // Ocultar ou exibir elementos externo, use a isLoaded de seu respetivo controlador.
  void setIsLoaded() => !_isLoaded;
}
