import 'package:flavor/flavor.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:irecipe/app/l10n/app_localizations.dart';
import 'package:irecipe/app/router/app_router.dart';
import 'package:irecipe/app/theme/light_theme.dart';

class App extends StatefulWidget {
  const App({super.key});

  static void setLocale(BuildContext context, Locale newLocale) {
    final stateLang = context.findAncestorStateOfType<_AppState>();

    stateLang?.changeLanguage(newLocale);
  }

  static void setTheme(BuildContext context, ThemeData newThemeData) {
    final stateTheme = context.findAncestorStateOfType<_AppState>();

    stateTheme?.changeTheme(newThemeData);
  }

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  Locale? _locale;
  ThemeData _themeData = AppThemeLight().themeData;

  changeTheme(ThemeData themeData) {
    setState(() {
      try {
        _themeData = themeData;
      } catch (e) {
        if (kDebugMode) {
          debugPrint(e.toString());
        }
        rethrow;
      }
    });
  }

  getLangCode() {
    var languageBox = Hive.box('languageSelected');
    String currentLanguage = languageBox.get('language');
    _locale = Locale(currentLanguage);
    return _locale;
  }

  changeLanguage(Locale locale) {
    setState(() {
      try {
        _locale = locale;
      } catch (e) {
        // _locale = const Locale('en', 'US');
        if (kDebugMode) {
          debugPrint(e.toString());
        }
        rethrow;
      }
    });
  }

  @override
  void initState() {
    
    super.initState();
    getLangCode();
  }

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return FlavorBanner(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        supportedLocales: L10n.supportedLocales,
        localizationsDelegates: L10n.localizationsDelegates,
        theme: _themeData,
        locale: _locale,
        routerConfig:
            _appRouter.config(navigatorObservers: () => [NavigatorObserver()]),
      ),
    );
  }
}
