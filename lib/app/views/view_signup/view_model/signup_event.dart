import 'package:flutter/material.dart';

abstract class SignUpEvent {}

class SignUpInitialEvent extends SignUpEvent {
  BuildContext context;
  SignUpInitialEvent(this.context);
}