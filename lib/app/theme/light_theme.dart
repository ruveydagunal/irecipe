import 'package:flutter/material.dart';

final class AppThemeLight {
  AppThemeLight._();
  static ThemeData getTheme() => ThemeData.light().copyWith(
        brightness: Brightness.light,
        useMaterial3: true
       

  );}