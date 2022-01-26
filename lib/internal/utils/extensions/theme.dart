import 'package:flutter/material.dart';

extension DarkTheme on ThemeData {
  bool get isDarkTheme => brightness == Brightness.dark;
}
