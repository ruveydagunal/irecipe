import 'package:flutter/material.dart';
import 'package:irecipe/core/constanst/color_constants.dart';

final class AppThemeLight {
  
   ThemeData get themeData=> ThemeData(
      useMaterial3: true,
      primaryColor: ColorConstants.primaryColor,
      appBarTheme: appBarTheme(),
      scaffoldBackgroundColor: ColorConstants.bgLight,
      colorScheme: colorScheme()

  );
        
  AppBarTheme appBarTheme(){
    return AppBarTheme(
      centerTitle: true,
      backgroundColor: ColorConstants.bgLight,
      elevation: 0,
      titleTextStyle: TextStyle(color: ColorConstants.textLight, fontSize: 30),
      iconTheme: IconThemeData(color: ColorConstants.textLight)
    );
  }

  ColorScheme colorScheme(){
    return ColorScheme.light(
      error: ColorConstants.errorColor,
      onBackground: ColorConstants.borderLight,
    );
  }


       
  }