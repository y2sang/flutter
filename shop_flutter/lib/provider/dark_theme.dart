import 'package:flutter/material.dart';

class DarkThemeProvider extends ChangeNotifier {
  bool _dartTheme = false;

  bool get isDarkTheme => _dartTheme;

  void toggleDarkTheme(bool value) {
    _dartTheme = value;
    notifyListeners();
  }
}
