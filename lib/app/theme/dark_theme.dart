import 'package:flutter/material.dart';

final class AppThemeDark {
  AppThemeDark._();
  static ThemeData getTheme() => ThemeData.dark().copyWith(
        brightness: Brightness.dark,
       

  );}