import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:irecipe/app/router/app_router.dart';
import 'package:irecipe/app/views/view_splash/view_model/splash_event.dart';
import 'package:irecipe/app/views/view_splash/view_model/splash_state.dart';
import 'package:irecipe/core/repository/service/auth_service.dart';

class SplashViewModel extends Bloc<SplashEvent, SplashState> {
  SplashViewModel() : super(SplashInitialState()) {
    on<SplashInitialEvent>(_onSplashInitial);
  }
  AuthService _authService = AuthService();
  Future<FutureOr<void>> _onSplashInitial(
      SplashInitialEvent event, Emitter<SplashState> emit) async {
    Future.delayed(const Duration(seconds: 3), () async {
      await _authService.isSignedIn()
          ? event.context.router.replace(HomeViewRoute())
          : event.context.router.replace(OnboardingViewRoute());
    });
  }
}
