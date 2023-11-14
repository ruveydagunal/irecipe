import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:irecipe/app/app.dart';
import 'package:irecipe/app/l10n/app_localizations.dart';
import 'package:irecipe/core/constanst/color_constants.dart';

class LanguageWidget extends StatefulWidget {
  const LanguageWidget({super.key});

  @override
  State<LanguageWidget> createState() => _LanguageWidgetState();
}

class _LanguageWidgetState extends State<LanguageWidget> {
  var languageBox = Hive.box('languageSelected');
  @override
  Widget build(BuildContext context) {
    String? currentValue = L10n.of(context)!.localeName;
    bool isDropdownOpen = false;

    currentValue = languageBox.get('language');
    print(currentValue);
    return DropdownButtonHideUnderline(
      child: DropdownButton(
        onChanged: (value) {
          setState(() {
            currentValue = value;
            isDropdownOpen = !isDropdownOpen;
          });
          languageBox.put('language', currentValue);
          App.setLocale(context, Locale(value!));
        },
        icon: Icon(
          Icons.arrow_drop_down,
          color: Colors.black,
        ),
        value: currentValue,
        items: [
          DropdownMenuItem(
              value: 'en',
              child: Text(
                'English',
                style: TextStyle(
                    color: isDropdownOpen == true
                        ? Colors.white
                        : ColorConstants.textLight),
              )),
          DropdownMenuItem(
              value: 'tr',
              child: Text('Türkçe',
                  style: TextStyle(color: ColorConstants.textLight)))
        ],
      ),
    );
  }
}
