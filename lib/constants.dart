import 'package:flutter/material.dart';

class Constants {
  static int _bluePrimaryValue = 0xFF66A4D9;
  static MaterialColor primaryColor = MaterialColor(
    _bluePrimaryValue,
    <int, Color>{
      50: Color(0xFFE6F0F9),
      100: Color(0xFFCCE1F2),
      200: Color(0xFFB3D1EC),
      300: Color(0xFF99C2E6),
      400: Color(0xFF80B3E0),
      500: Color(_bluePrimaryValue),
      600: Color(0xFF4D95D3),
      700: Color(0xFF3385CD),
      800: Color(0xFF1A76C6),
      900: Color(0xFF0067C0),
    },
  );
}
