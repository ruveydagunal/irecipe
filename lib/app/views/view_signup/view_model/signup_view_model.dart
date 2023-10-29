import 'dart:async';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:irecipe/app/views/view_signin/signin_view.dart';
import 'package:irecipe/app/views/view_signup/view_model/signup_event.dart';
import 'package:irecipe/app/views/view_signup/view_model/signup_state.dart';
import 'package:irecipe/core/repository/model/auth/signup/signup_request_model.dart';
import 'package:irecipe/core/repository/service/auth_service.dart';

class SignUpViewModel extends Bloc<SignUpEvent, SignUpState> {
  SignUpViewModel() : super(SignUpInitial()) {
    on<SignUpInitialEvent>(_onSignUpInitialEvent);
  }

  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  AuthService authService = AuthService();

  Future<FutureOr<void>> _onSignUpInitialEvent(
      SignUpInitialEvent event, Emitter<SignUpState> emit) async {
    try {
      await authService.signUp(SignUpRequestModel(
          name: nameController.text,
          surname: surnameController.text.trim(),
          email: emailController.text.trim(),
          password: passwordController.text.trim()));

      Future.delayed(const Duration(seconds: 2), () {
        Navigator.of(event.context).push(MaterialPageRoute(builder: (context) {
          return  SignInView();
        }));
      });
    } catch (e, stack) {
      FirebaseCrashlytics.instance.recordError(e, stack, fatal: true);
    }
  }
}
