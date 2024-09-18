import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode _themeData = ThemeMode.dark;
  get themeData => _themeData;

  void toggleTheme() {
    _themeData =
        _themeData == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  bool isDartMode() {
    if (_themeData == ThemeMode.dark) {
      return true;
    }
    return false;
  }
}
