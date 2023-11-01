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
    AddingRecipeViewRoute.name: (routeData) {
      final args = routeData.argsAs<AddingRecipeViewRouteArgs>(
          orElse: () => const AddingRecipeViewRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AddingRecipeView(key: args.key),
      );
    },
    BottomNavigationWidgetRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BottomNavigationWidget(),
      );
    },
    CategoriesViewRoute.name: (routeData) {
      final args = routeData.argsAs<CategoriesViewRouteArgs>(
          orElse: () => const CategoriesViewRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CategoriesView(key: args.key),
      );
    },
    DetailViewRoute.name: (routeData) {
      final args = routeData.argsAs<DetailViewRouteArgs>(
          orElse: () => const DetailViewRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DetailView(key: args.key),
      );
    },
    FavoriteViewRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FavoriteView(),
      );
    },
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
    ProfileViewRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfileView(),
      );
    },
    SettingsViewRoute.name: (routeData) {
      final args = routeData.argsAs<SettingsViewRouteArgs>(
          orElse: () => const SettingsViewRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SettingsView(key: args.key),
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
/// [AddingRecipeView]
class AddingRecipeViewRoute extends PageRouteInfo<AddingRecipeViewRouteArgs> {
  AddingRecipeViewRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          AddingRecipeViewRoute.name,
          args: AddingRecipeViewRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'AddingRecipeViewRoute';

  static const PageInfo<AddingRecipeViewRouteArgs> page =
      PageInfo<AddingRecipeViewRouteArgs>(name);
}

class AddingRecipeViewRouteArgs {
  const AddingRecipeViewRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'AddingRecipeViewRouteArgs{key: $key}';
  }
}

/// generated route for
/// [BottomNavigationWidget]
class BottomNavigationWidgetRoute extends PageRouteInfo<void> {
  const BottomNavigationWidgetRoute({List<PageRouteInfo>? children})
      : super(
          BottomNavigationWidgetRoute.name,
          initialChildren: children,
        );

  static const String name = 'BottomNavigationWidgetRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CategoriesView]
class CategoriesViewRoute extends PageRouteInfo<CategoriesViewRouteArgs> {
  CategoriesViewRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          CategoriesViewRoute.name,
          args: CategoriesViewRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'CategoriesViewRoute';

  static const PageInfo<CategoriesViewRouteArgs> page =
      PageInfo<CategoriesViewRouteArgs>(name);
}

class CategoriesViewRouteArgs {
  const CategoriesViewRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'CategoriesViewRouteArgs{key: $key}';
  }
}

/// generated route for
/// [DetailView]
class DetailViewRoute extends PageRouteInfo<DetailViewRouteArgs> {
  DetailViewRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          DetailViewRoute.name,
          args: DetailViewRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'DetailViewRoute';

  static const PageInfo<DetailViewRouteArgs> page =
      PageInfo<DetailViewRouteArgs>(name);
}

class DetailViewRouteArgs {
  const DetailViewRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'DetailViewRouteArgs{key: $key}';
  }
}

/// generated route for
/// [FavoriteView]
class FavoriteViewRoute extends PageRouteInfo<void> {
  const FavoriteViewRoute({List<PageRouteInfo>? children})
      : super(
          FavoriteViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'FavoriteViewRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
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
/// [ProfileView]
class ProfileViewRoute extends PageRouteInfo<void> {
  const ProfileViewRoute({List<PageRouteInfo>? children})
      : super(
          ProfileViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileViewRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingsView]
class SettingsViewRoute extends PageRouteInfo<SettingsViewRouteArgs> {
  SettingsViewRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          SettingsViewRoute.name,
          args: SettingsViewRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SettingsViewRoute';

  static const PageInfo<SettingsViewRouteArgs> page =
      PageInfo<SettingsViewRouteArgs>(name);
}

class SettingsViewRouteArgs {
  const SettingsViewRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'SettingsViewRouteArgs{key: $key}';
  }
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
