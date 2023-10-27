// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeViewRoute.name: (routeData) {
      final args = routeData.argsAs<HomeViewRouteArgs>(
          orElse: () => const HomeViewRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: HomeView(key: args.key),
      );
    },
    OnboardingViewRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OnboardingView(),
      );
    },
    SignInViewRoute.name: (routeData) {
      final args = routeData.argsAs<SignInViewRouteArgs>(
          orElse: () => const SignInViewRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SignInView(key: args.key),
      );
    },
    SignUpViewRoute.name: (routeData) {
      final args = routeData.argsAs<SignUpViewRouteArgs>(
          orElse: () => const SignUpViewRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SignUpView(key: args.key),
      );
    },
    SplashViewRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashView(),
      );
    },
  };
}

/// generated route for
/// [HomeView]
class HomeViewRoute extends PageRouteInfo<HomeViewRouteArgs> {
  HomeViewRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          HomeViewRoute.name,
          args: HomeViewRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'HomeViewRoute';

  static const PageInfo<HomeViewRouteArgs> page =
      PageInfo<HomeViewRouteArgs>(name);
}

class HomeViewRouteArgs {
  const HomeViewRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'HomeViewRouteArgs{key: $key}';
  }
}

/// generated route for
/// [OnboardingView]
class OnboardingViewRoute extends PageRouteInfo<void> {
  const OnboardingViewRoute({List<PageRouteInfo>? children})
      : super(
          OnboardingViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingViewRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SignInView]
class SignInViewRoute extends PageRouteInfo<SignInViewRouteArgs> {
  SignInViewRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          SignInViewRoute.name,
          args: SignInViewRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SignInViewRoute';

  static const PageInfo<SignInViewRouteArgs> page =
      PageInfo<SignInViewRouteArgs>(name);
}

class SignInViewRouteArgs {
  const SignInViewRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'SignInViewRouteArgs{key: $key}';
  }
}

/// generated route for
/// [SignUpView]
class SignUpViewRoute extends PageRouteInfo<SignUpViewRouteArgs> {
  SignUpViewRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          SignUpViewRoute.name,
          args: SignUpViewRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SignUpViewRoute';

  static const PageInfo<SignUpViewRouteArgs> page =
      PageInfo<SignUpViewRouteArgs>(name);
}

class SignUpViewRouteArgs {
  const SignUpViewRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'SignUpViewRouteArgs{key: $key}';
  }
}

/// generated route for
/// [SplashView]
class SplashViewRoute extends PageRouteInfo<void> {
  const SplashViewRoute({List<PageRouteInfo>? children})
      : super(
          SplashViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashViewRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
