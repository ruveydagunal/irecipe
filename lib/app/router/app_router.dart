import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:irecipe/app/views/view_adding_recipe/adding_recipe_view.dart';
import 'package:irecipe/app/views/view_categories/categories_view.dart';
import 'package:irecipe/app/views/view_categories/detail_view.dart';
import 'package:irecipe/app/views/view_favorite/favorite_view.dart';
import 'package:irecipe/app/views/view_food_detail/food_detail_view.dart';
import 'package:irecipe/app/views/view_home/home_view.dart';
import 'package:irecipe/app/views/view_onboarding/onboarding_view.dart';
import 'package:irecipe/app/views/view_profile/profile_view.dart';
import 'package:irecipe/app/views/view_settings/settings_view.dart';
import 'package:irecipe/app/views/view_signin/signin_view.dart';
import 'package:irecipe/app/views/view_signup/signup_view.dart';
import 'package:irecipe/app/views/view_splash/splash_view.dart';
import 'package:irecipe/core/widgets/bottom_navigation.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'View',
)
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(initial: true, page: SplashViewRoute.page),
        AutoRoute(page: OnboardingViewRoute.page),
        AutoRoute(page: SignUpViewRoute.page),
        AutoRoute(page: SignInViewRoute.page),
        AutoRoute(page: HomeViewRoute.page),
        AutoRoute(page: SettingsViewRoute.page),
        AutoRoute(page: FavoriteViewRoute.page),
        AutoRoute(page: BottomNavigationWidgetRoute.page, children: [
          AutoRoute(page: HomeViewRoute.page),
          AutoRoute(page: CategoriesViewRoute.page),
          AutoRoute(page: AddingRecipeViewRoute.page),
          AutoRoute(page: FavoriteViewRoute.page),
          AutoRoute(page: ProfileViewRoute.page)
        ]),
        AutoRoute(page: DetailViewRoute.page),
      ];
}
