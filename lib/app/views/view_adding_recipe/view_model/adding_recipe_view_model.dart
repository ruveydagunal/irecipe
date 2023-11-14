import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:irecipe/app/l10n/app_localizations.dart';
import 'package:irecipe/app/views/view_adding_recipe/view_model/adding_recipe_event.dart';
import 'package:irecipe/app/views/view_adding_recipe/view_model/adding_recipe_state.dart';
import 'package:super_toast/super_toast.dart';

class AddingRecipeViewModel extends Bloc<AddingRecipeEvent, AddingRecipeState> {
  AddingRecipeViewModel() : super(AddingRecipeInitialState()) {
    on<AddingRecipeInitalEvent>(_onAddingRecipeInitialEvent);
  }

  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController recipeNameController = TextEditingController();
  TextEditingController materialsController = TextEditingController();
  TextEditingController preparationController = TextEditingController();
  TextEditingController imageLinkController = TextEditingController();

  Future<FutureOr<void>> _onAddingRecipeInitialEvent(
      AddingRecipeInitalEvent event, Emitter<AddingRecipeState> emit) async {
    try {
      List<String> materials = materialsController.text.split(',');

      await fireStore.collection('recipes').add({
        'recipeName': recipeNameController.text,
        'materials': materials,
        'preparation': preparationController.text,
        'imageLink': imageLinkController.text,
      });
      print('Veri başarıyla kaydedildi.');

      
      //  SuperToast.showSuccess(context, message: L10n.of(context)!.successLoginMessage);

      recipeNameController.clear();
      materialsController.clear();
      preparationController.clear();
      imageLinkController.clear();
    } catch (e) {
      print('Veri kaydedilirken hata oluştu: $e');
    }
        
      }
}
 