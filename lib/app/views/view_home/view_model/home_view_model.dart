import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:irecipe/app/views/view_home/view_model/home_event.dart';
import 'package:irecipe/app/views/view_home/view_model/home_state.dart';

class HomeViewModel extends Bloc<HomeEvent, HomeState> {
  HomeViewModel() : super(HomeInitialState(recipes: [])) {
    on<HomeInitialEvent>(_initial);
  }

  final databaseReference = FirebaseDatabase.instance.ref();

  Future<FutureOr<void>> _initial(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    DatabaseReference databaseReference =
        FirebaseDatabase.instance.ref('recipes');
    await databaseReference.get().then((DataSnapshot snapshot) {
      if (snapshot.value != null) {
        List<dynamic>? recipes = snapshot.value as List<dynamic>;
        recipes.shuffle();
        emit(HomeInitialState(recipes: recipes));
      }
    });
    

  }
}