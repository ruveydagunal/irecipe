import 'package:flutter/material.dart';

abstract class SignInEvent {}

class SignInInitialEvent extends SignInEvent{
  BuildContext context;
  SignInInitialEvent(this.context); 
}