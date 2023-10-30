import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:irecipe/app/l10n/app_localizations.dart';
import 'package:irecipe/app/router/app_router.dart';
import 'package:irecipe/app/views/view_profile/widgets/profile_widgets.dart';
import 'package:irecipe/core/constanst/color_constants.dart';

@RoutePage()
class ProfileView extends StatelessWidget with ProfileWidgets {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Profile'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Hoşgeldin Ruveyda',
                    style: TextStyle(
                        color: ColorConstants.containerColorLight,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  )),
            ),
            profileButton(
                context: context,
                text: 'Personal Info',
                suffixIcon: Icons.person,
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Container(
                        height: 300,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              profileInfoContainer(
                                label: L10n.of(context)!.name,
                              ),
                              profileInfoContainer(
                                  label: L10n.of(context)!.surname),
                              profileInfoContainer(label: L10n.of(context)!.email),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }),
            profileButton(
                context: context,
                text: 'My Recipe',
                suffixIcon: Icons.restaurant_menu_outlined,
                onPressed: () {}),
            profileButton(
                context: context,
                text: 'Settings',
                suffixIcon: Icons.settings,
                onPressed: () {
                  context.router.push(SettingsViewRoute());
                })
          ],
        ));
  }
}
