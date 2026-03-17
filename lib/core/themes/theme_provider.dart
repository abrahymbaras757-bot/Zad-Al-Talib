import 'package:flutter/material.dart';
import 'package:zad_altalib/core/themes/dark_mode.dart';
import 'package:zad_altalib/core/themes/light_mode.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = lightMode;
  ThemeData get themeData => _themeData;
  bool get isDarkMode => _themeData == darkMode;
  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme(bool isDark) {
    themeData = isDark ? darkMode : lightMode;
    // if (_themeData == lightMode) {
    //   themeData = darkMode;
    // } else {
    //   themeData = lightMode;
    // }
  }
}
