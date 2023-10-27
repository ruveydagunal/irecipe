import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:irecipe/app/router/app_router.dart';
import 'package:irecipe/app/views/view_signin/view_model/signin_event.dart';
import 'package:irecipe/app/views/view_signin/view_model/signin_state.dart';
import 'package:irecipe/core/repository/model/auth/signin/signin_request_model.dart';
import 'package:irecipe/core/repository/service/auth_service.dart';
import 'package:irecipe/core/widgets/snackbar_widget.dart';

class SignInViewModel extends Bloc<SignInEvent, SignInState> {
  SignInViewModel() : super(SignInInitialState()) {
    on<SignInInitialEvent>(_initial);
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  AuthService authService = AuthService();

  Future<FutureOr<void>> _initial(
      SignInInitialEvent event, Emitter<SignInState> emit) async {
    try {
      await authService.signIn(SignInRequestModel(
          email: emailController.text.trim(),
          password: passwordController.text.trim()));
      ScaffoldMessenger.of(event.context).showSnackBar(SnackBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          content: SnackBarWidget.success(
            subTitle: 'Giriş başarılı, ana sayfaya yönlendiriliyorsunuz...',
          )));
       Future.delayed(const Duration(seconds: 2), () {
     event.context.router.push(HomeViewRoute());
    });
    } catch (e, stack) {
      FirebaseCrashlytics.instance.recordError(e, stack, fatal: true);
      FirebaseAuthException exception = e as FirebaseAuthException;
      exception.code == 'invalid-email'
          ? Future.delayed(const Duration(seconds: 2), () {
              ScaffoldMessenger.of(event.context).showSnackBar(SnackBar(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  content: SnackBarWidget.error(
                    subTitle: 'Email formatınız hatalı',
                  )));
            })
          : Future.delayed(const Duration(seconds: 2), () {
              ScaffoldMessenger.of(event.context).showSnackBar(SnackBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  content: SnackBarWidget.error(
                    subTitle: 'Email veya şifre hatalı',
                  )));
            });
    }
  }
}
