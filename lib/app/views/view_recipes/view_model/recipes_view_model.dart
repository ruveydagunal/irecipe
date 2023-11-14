import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:irecipe/app/views/view_recipes/view_model/recipes_event.dart';
import 'package:irecipe/app/views/view_recipes/view_model/recipes_state.dart';

class RecipesViewModel extends Bloc<RecipesEvent, RecipesState> {
  RecipesViewModel() : super(RecipesInitialState(recipes: [])) {
    on<RecipesInitalEvent>(_initial);
  }

  CollectionReference firestore = FirebaseFirestore.instance.collection('recipes');
    User? user = FirebaseAuth.instance.currentUser;
  List<dynamic>? myRecipe = [];


  Future<FutureOr<void>> _initial(
      RecipesInitalEvent event, Emitter<RecipesState> emit) async {
    final response =  await firestore.get();
    response.docs.forEach((element) {
     myRecipe?.add(element.data()); 
      
    },);
    emit(RecipesInitialState(recipes: myRecipe));
    print('response ${state.recipes}');
  }
}
