import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:irecipe/app/l10n/app_localizations.dart';
import 'package:irecipe/app/router/app_router.dart';
import 'package:irecipe/app/views/view_signin/view_model/signin_event.dart';
import 'package:irecipe/app/views/view_signin/view_model/signin_state.dart';
import 'package:irecipe/core/repository/model/auth/signin/signin_request_model.dart';
import 'package:irecipe/core/repository/service/auth_service.dart';

import 'package:super_toast/super_toast.dart';

class SignInViewModel extends Bloc<SignInEvent, SignInState> {
  SignInViewModel() : super(SignInInitialState()) {
    on<SignInInitialEvent>(_initial);
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  AuthService authService = AuthService();

  Future<FutureOr<void>> _initial(
      SignInInitialEvent event, Emitter<SignInState> emit) async {
        FocusManager.instance.primaryFocus?.unfocus();
    try {
      await authService.signIn(SignInRequestModel(
          email: emailController.text.trim(),
          password: passwordController.text.trim()));
          SuperToast.showSuccess(event.context, message: L10n.of(event.context)!.successLoginMessage);
       Future.delayed(const Duration(seconds: 2), () {
     event.context.router.replace(BottomNavigationWidgetRoute());
    });
    } catch (e, stack) {
      FirebaseCrashlytics.instance.recordError(e, stack, fatal: true);
      FirebaseAuthException exception = e as FirebaseAuthException;
      exception.code == 'invalid-email'
          ? Future.delayed(const Duration(seconds: 2), () {
              SuperToast.showFail(event.context, message: L10n.of(event.context)!.inCorrectEmailFormatMessage);
            })
          : Future.delayed(const Duration(seconds: 2), () {
            SuperToast.showFail(event.context, message: L10n.of(event.context)!.inCorrectEmailPasswordMessage);
            });
    }
  }
}
