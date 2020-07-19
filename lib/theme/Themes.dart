import 'package:flutter/material.dart';

ThemeData crowTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    primaryColor: _hexToColor("#c68a23"),
    accentColor: _hexToColor("#c68a23"),
    buttonColor: _hexToColor("#c68a23"),
    buttonTheme: ButtonThemeData(minWidth: 80, height: 30, textTheme: ButtonTextTheme.primary),
  );
}

ThemeData darkTheme() {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
    primaryColor: _hexToColor("#665666"),
    accentColor: _hexToColor("#665666"),
    buttonColor: _hexToColor("#665666"),
    buttonTheme: ButtonThemeData(minWidth: 80, height: 30, textTheme: ButtonTextTheme.primary),
  );
}



Color _hexToColor(String s) 
 => Color(int.parse(s.substring(1, 7), radix: 16) + 0xFF000000);
