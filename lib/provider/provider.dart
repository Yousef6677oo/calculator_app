import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.light;

  changeCurrentThemeToLight() {
    notifyListeners();
    currentTheme = ThemeMode.light;
  }

  changeCurrentThemeToDark() {
    notifyListeners();
    currentTheme = ThemeMode.dark;
  }
}
