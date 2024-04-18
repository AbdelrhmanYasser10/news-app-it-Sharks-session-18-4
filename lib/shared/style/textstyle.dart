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

  static TextStyle titleSliderTextStyle ()=> const TextStyle(
    fontSize: 18,
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontFamily: _fontFamily,
  );

  static TextStyle titlePopularTextStyle ()=> const TextStyle(
    fontSize: 22,
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontFamily: _fontFamily,
  );

  static TextStyle descriptionSliderTextStyle ()=> const TextStyle(
    fontSize: 14,
    color: Colors.white,
    fontWeight: FontWeight.w500,
    fontFamily: _fontFamily,
  );
  static TextStyle descriptionPopularTextStyle ()=> const TextStyle(
    fontSize: 18,
    color: Colors.black,
    fontWeight: FontWeight.w500,
    fontFamily: _fontFamily,
  );

  static TextStyle authorSliderTextStyle ()=> const TextStyle(
    fontSize: 12,
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontFamily: _fontFamily,
  );

  static TextStyle authorPopularTextStyle ()=> const TextStyle(
    fontSize: 14,
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontFamily: _fontFamily,
  );

}