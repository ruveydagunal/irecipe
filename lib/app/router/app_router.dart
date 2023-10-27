import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:irecipe/app/views/view_home/home_view.dart';
import 'package:irecipe/app/views/view_onboarding/onboarding_view.dart';
import 'package:irecipe/app/views/view_signin/signin_view.dart';
import 'package:irecipe/app/views/view_signup/signup_view.dart';
import 'package:irecipe/app/views/view_splash/splash_view.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'View',
)
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(initial: true,  page: SplashViewRoute.page),
        AutoRoute(page: OnboardingViewRoute.page),
        AutoRoute(page: SignUpViewRoute.page),
        AutoRoute(page: SignInViewRoute.page),
        AutoRoute(page: HomeViewRoute.page)
        
        
      ];
}
