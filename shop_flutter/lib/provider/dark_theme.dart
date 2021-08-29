import 'package:flutter/material.dart';
import 'package:shop_flutter/models/dark_theme_pref.dart';

class DarkThemeProvider extends ChangeNotifier {
  DarkThemePreferences darkThemePreferences = DarkThemePreferences();
  bool _dartTheme = false;

  bool get isDarkTheme => _dartTheme;

  set darkTheme(bool value) {
    this.toggleDarkTheme(value);
  }

  void toggleDarkTheme(bool value) {
    _dartTheme = value;
    darkThemePreferences.setDarkTheme(value);
    notifyListeners();
  }
}
