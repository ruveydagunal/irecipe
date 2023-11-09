import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:irecipe/app/views/view_home/view_model/home_event.dart';
import 'package:irecipe/app/views/view_home/view_model/home_state.dart';

class HomeViewModel extends Bloc<HomeEvent, HomeState> {
  HomeViewModel() : super(HomeInitialState(recipe_en: [])) {
    on<HomeInitialEvent>(_initial);
  }

  final databaseReference = FirebaseDatabase.instance.ref();

  Future<FutureOr<void>> _initial(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    DatabaseReference databaseReference =
        FirebaseDatabase.instance.ref('recipe_en');
    await databaseReference.get().then((DataSnapshot snapshot) {
      if (snapshot.value != null) {
        List<dynamic>? recipe_en = snapshot.value as List<dynamic>;
        recipe_en.shuffle();
        emit(HomeInitialState(recipe_en: recipe_en));
      }
    });
  }


}