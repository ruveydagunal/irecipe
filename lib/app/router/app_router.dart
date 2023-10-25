import 'package:auto_route/auto_route.dart';
import 'package:irecipe/app/views/view_onboarding/onboarding_view.dart';
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
        
      ];
}
