import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:irecipe/app/app.dart';
import 'package:irecipe/app/theme/dark_theme.dart';
import 'package:irecipe/app/theme/light_theme.dart';


class ThemeWidget extends StatefulWidget {
  const ThemeWidget({super.key});

  @override
  State<ThemeWidget> createState() => _ThemeWidgetState();
}

bool isDark = false;

class _ThemeWidgetState extends State<ThemeWidget> {
  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      value: isDark,
      onChanged: (value) {
        isDark = value;
        setState(() {
          isDark == false
              ? App.setTheme(context, AppThemeLight().themeData)
              : App.setTheme(context, AppThemeDark().themeData);
        });
      },
    );
  }
}
