import 'package:flutter/material.dart';

class SetTheme {
  static var topBarForeground = Colors.black;
  static var topBarBackground = Colors.white;
  static var bodyForeground = Colors.white;
  static var bodybackground = Colors.black;

  static void themeMode(bool mode) {
    if (mode) {
      topBarForeground = Colors.white;
      topBarBackground = Colors.black;
      bodyForeground = Colors.black;
      bodybackground = Colors.white;
    } else {
      topBarForeground = Colors.black;
      topBarBackground = Colors.white;
      bodyForeground = Colors.white;
      bodybackground = Colors.black;
    }
  }
}

/*class Dark{
  static var topBarForeground = Colors.black;
  static var topBarBackground = Colors.white;
  static var bodyForeground = Colors.white;
  static var bodybackground = Colors.black;
}*/

/*class Light{
  static var topBarForeground = Colors.white;
  static var topBarBackground = Colors.black;
  static var bodyForeground = Colors.black;
  static var bodybackground = Colors.white;
}*/