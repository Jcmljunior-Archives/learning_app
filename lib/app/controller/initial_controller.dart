import '../controller/counter_controller.dart';

class InitialController {
  // Provedores de ações:
  CounterController counter = CounterController();

  // Define o estado da página inicial. (Carregando, carregado)
  bool isLoaded = false;
}
