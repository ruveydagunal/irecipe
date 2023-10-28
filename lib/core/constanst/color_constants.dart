import 'package:flutter/material.dart';

@immutable
final class ColorConstants {
  const ColorConstants._();

  static Color primaryColor = Colors.orange.shade800;
  static const Color errorColor = Colors.red;
  static const Color successColor = Colors.green;
  static const Color warningColor = Colors.orange;
  static const Color infoColor = Colors.blue;

  //button color
  static const Color buttonColor = Colors.orange;
  static Color containerColorLight = Colors.orange.shade300;

  //background color
  static const Color bgLight = Colors.white;
  static const Color bgDark = Color(0xFF121212);

  //text and icon color
  static const Color textLight = Colors.black;
  static const Color textDark = Colors.white;

  //border color
  static const Color borderLight = Colors.black;
  static const Color borderDark = Colors.white;
  static const Color borderError = Color(0xFFF44336);
  static const Color borderSuccess = Color(0xFF66BB6B);
  static const Color borderWarning = Color(0xFFFFA525);

}
