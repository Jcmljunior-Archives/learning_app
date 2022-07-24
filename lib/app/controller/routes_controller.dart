import 'package:flutter/material.dart';
import 'package:learning_app/app/view/splash_view.dart';

import '../view/home_view.dart';

class RoutesController {
  String initialPath;
  late String activePath;

  RoutesController({
    required this.initialPath,
  });

  setActivePath(String path) {
    activePath = path;
  }

  Map<String, WidgetBuilder> getAll() {
    return <String, WidgetBuilder>{
      initialPath: (BuildContext context) => const SplashView(),
      '/home': (BuildContext context) => const HomeView(),
    };
  }
}
