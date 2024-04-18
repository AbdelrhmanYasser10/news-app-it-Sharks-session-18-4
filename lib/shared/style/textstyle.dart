import'package:flutter/material.dart';

// Reusable component
abstract class AppTextStyle{

  static const String _fontFamily = "Ubuntu";

  static TextStyle appBarTextStyle() => const TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    fontFamily: _fontFamily,
    color: Colors.black
  );

  static TextStyle titleTextStyle() => const TextStyle(
      fontSize: 26.0,
      fontWeight: FontWeight.bold,
      fontFamily: _fontFamily,
      color: Colors.black
  );

  static TextStyle labelStyle ()=> const TextStyle(
    fontFamily: _fontFamily,
  );

}