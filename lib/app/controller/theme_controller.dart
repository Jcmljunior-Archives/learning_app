import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../model/palette_model.dart';

enum BrightnessOptions {
  brightnessLight,
  brightnessDark,
  brightnessNative,
}

class ThemeController {
  BrightnessOptions scheme;
  int selectedColorScheme;

  late ThemeData data;

  ThemeController({
    required this.scheme,
    required this.selectedColorScheme,
  });

  getBrightness() {
    switch (scheme) {
      case BrightnessOptions.brightnessLight:
        return Brightness.light;

      case BrightnessOptions.brightnessDark:
        return Brightness.dark;

      default:
        return SchedulerBinding.instance.window.platformBrightness;
    }
  }

  updateThemes() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: PaletteModel.colorItems.elementAt(selectedColorScheme),
      brightness: getBrightness(),
    );
  }

  void setSeletectedColorScheme(int index) {
    selectedColorScheme = index;
    data = updateThemes();
  }

  void setColorScheme(BrightnessOptions color) {
    scheme = color;
    data = updateThemes();
  }
}
