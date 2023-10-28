import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:irecipe/app/l10n/app_localizations.dart';
import 'package:irecipe/app/router/app_router.dart';
import 'package:irecipe/app/views/view_settings/widget/settings_widgets.dart';
import 'package:irecipe/core/constanst/color_constants.dart';
import 'package:irecipe/core/repository/service/auth_service.dart';
import 'package:irecipe/core/widgets/language_widget.dart';
import 'package:irecipe/core/widgets/theme_switch.dart';
import 'package:super_toast/super_toast.dart';

import 'package:uuid/uuid.dart';

@RoutePage()
class SettingsView extends StatelessWidget with SettingsWidget {
  SettingsView({super.key});
  AuthService authService = AuthService();

  Uuid uuid = const Uuid();

  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(L10n.of(context)!.settings),
        actions: [
          IconButton(
              onPressed: () async {
                await authService.signOut();
                SuperToast.showInfo(context,
                    message: L10n.of(context)!.exitMessage);
                context.router.replace(SplashViewRoute());
              },
              icon: const Icon(
                Icons.logout,
                color: ColorConstants.errorColor,
              ))
        ],
      ),
      body: Column(
        children: [
          settingsContainer(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Text(
                              'Profile',
                              style: TextStyle(fontSize: 24),
                            ),
                            profileInfoContainer(
                              label: L10n.of(context)!.name,
                            ),
                            profileInfoContainer(
                                label: L10n.of(context)!.surname),
                            profileInfoContainer(
                                label: L10n.of(context)!.email),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              context: context,
              text: L10n.of(context)!.profile,
              suffixIcon: Icons.person_outline),
          settingsContainer(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Container();
                  },
                );
              },
              context: context,
              text: L10n.of(context)!.about,
              suffixIcon: Icons.info_outline),
          settingsContainer(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Container();
                  },
                );
              },
              context: context,
              text: L10n.of(context)!.privacy,
              suffixIcon: Icons.privacy_tip_outlined),
          settingsContainer(
              onPressed: () {},
              context: context,
              text: L10n.of(context)!.theme,
              prefixIcon: ThemeWidget(),
              suffixIcon: Icons.contrast_outlined),
          settingsContainer(
              onPressed: () {},
              context: context,
              text: L10n.of(context)!.language,
              prefixIcon: LanguageWidget(),
              suffixIcon: Icons.language_outlined),
        ],
      ),
    );
  }
}
