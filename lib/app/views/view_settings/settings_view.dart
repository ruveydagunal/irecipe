
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:irecipe/app/l10n/app_localizations.dart';
import 'package:irecipe/app/router/app_router.dart';
import 'package:irecipe/core/repository/service/auth_service.dart';
import 'package:super_toast/super_toast.dart';

import 'package:uuid/uuid.dart';

@RoutePage()
class SettingsView extends StatelessWidget {
  SettingsView({super.key});
  AuthService authService = AuthService();

  Uuid uuid = const Uuid();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        actions: [
          IconButton(
              onPressed: () async {
                await authService.signOut();
                SuperToast.showInfo(context, message: L10n.of(context)!.validEmailMessage);

                context.router.replace(SplashViewRoute());
              },
              icon: const Icon(Icons.logout))
        ],
      ),

    );
  }
}
