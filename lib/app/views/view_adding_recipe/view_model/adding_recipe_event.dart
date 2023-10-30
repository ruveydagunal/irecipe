import 'package:flutter/material.dart';

abstract class AddingRecipeEvent {}

class AddingRecipeInitalEvent extends AddingRecipeEvent{
  BuildContext context;
  AddingRecipeInitalEvent(this.context); 
}