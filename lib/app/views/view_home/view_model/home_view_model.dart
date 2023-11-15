import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:irecipe/app/views/view_home/view_model/home_event.dart';
import 'package:irecipe/app/views/view_home/view_model/home_state.dart';

class HomeViewModel extends Bloc<HomeEvent, HomeState> {
  HomeViewModel() : super(HomeInitialState(recipe: [])) {
    on<HomeInitialEvent>(_initial);
  }
  String? _locale;

  final databaseReference = FirebaseDatabase.instance.ref();
  getLangCode() {
    var languageBox = Hive.box('languageSelected');
    String currentLanguage = languageBox.get('language');
    _locale = currentLanguage;
    return _locale;
  }

  Future<FutureOr<void>> _initial(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    getLangCode();
    DatabaseReference databaseReference =
        FirebaseDatabase.instance.ref('recipe_$_locale');
    await databaseReference.get().then((DataSnapshot snapshot) {
      if (snapshot.value != null) {
        List<dynamic>? recipe = snapshot.value as List<dynamic>;
        recipe.shuffle();
        emit(HomeInitialState(recipe: recipe));
      }
    });
  }
}
