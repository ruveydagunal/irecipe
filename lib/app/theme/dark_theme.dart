import 'package:flutter/material.dart';
import 'package:irecipe/core/constanst/color_constants.dart';

final class AppThemeDark {
  
   ThemeData get themeData=> ThemeData(
      useMaterial3: true,
      primaryColor: ColorConstants.primaryColor,
      appBarTheme: appBarTheme(),
      scaffoldBackgroundColor: ColorConstants.bgDark,
      colorScheme: colorScheme()

  );
        
  AppBarTheme appBarTheme(){
    return AppBarTheme(
      centerTitle: true,
      backgroundColor: ColorConstants.bgDark,
      elevation: 0,
      titleTextStyle: TextStyle(color: ColorConstants.textDark, fontSize: 30),
      iconTheme: IconThemeData(color: ColorConstants.textDark)
    );
  }

ColorScheme colorScheme(){
    return ColorScheme.dark(
      error: ColorConstants.errorColor,
      onBackground: ColorConstants.borderDark,
    );
  }
       
  }