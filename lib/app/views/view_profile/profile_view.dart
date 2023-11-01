import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:irecipe/app/l10n/app_localizations.dart';
import 'package:irecipe/app/router/app_router.dart';
import 'package:irecipe/app/views/view_profile/view_model/profile_event.dart';
import 'package:irecipe/app/views/view_profile/view_model/profile_state.dart';
import 'package:irecipe/app/views/view_profile/view_model/profile_view_model.dart';
import 'package:irecipe/app/views/view_profile/widgets/profile_widgets.dart';
import 'package:irecipe/core/constanst/color_constants.dart';
import 'package:irecipe/core/extensions/context_extension.dart';

@RoutePage()
class ProfileView extends StatelessWidget with ProfileWidgets {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ProfileViewModel()..add(ProfileInitialEvent()),
        child: BlocBuilder<ProfileViewModel, ProfileState>(
            builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                title: Text(
                  L10n.of(context)!.myFavorites,
                ),
              ),
              body: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          '${L10n.of(context)!.welcome}' ' ${state.name}',
                          style: TextStyle(
                              color: ColorConstants.containerColorLight,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        )),
                  ),
                  profileButton(
                      context: context,
                      text: L10n.of(context)!.personalInfo,
                      suffixIcon: Icons.person,
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container(
                              height: 300,
                              child: Padding(
                                padding: context.paddingNormal,
                                child: Column(
                                  children: [
                                    profileInfoContainer(
                                      label: L10n.of(context)!.name,
                                      initialValue: state.name,
                                    ),
                                    profileInfoContainer(
                                        label: L10n.of(context)!.surname,
                                        initialValue: state.surname
                                        ),
                                    profileInfoContainer(
                                        label: L10n.of(context)!.email,
                                        initialValue: state.email
                                        ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }),
                  profileButton(
                      context: context,
                      text: L10n.of(context)!.myRecipe,
                      suffixIcon: Icons.restaurant_menu_outlined,
                      onPressed: () {}),
                  profileButton(
                      context: context,
                      text: L10n.of(context)!.settings,
                      suffixIcon: Icons.settings,
                      onPressed: () {
                        context.router.push(SettingsViewRoute());
                      })
                ],
              ));
        }));
  }
}
