import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:irecipe/app/views/view_categories/view_model/categories_event.dart';
import 'package:irecipe/app/views/view_categories/view_model/categories_state.dart';

class CategoriesViewModel extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesViewModel()
      : super(CategoriesInitialState(recipe: [], currentIndex: 0)) {
    on<CategoriesInitialEvent>(_initial);
    on<CurrentPageIndexEvent>(_currentPageIndex);
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
      CategoriesInitialEvent event, Emitter<CategoriesState> emit) async {
        getLangCode();
    DatabaseReference mainReference =
        FirebaseDatabase.instance.ref('recipe_$_locale');
    await mainReference.get().then((DataSnapshot snapshot) {
      if (snapshot.value != null) {
        List<dynamic>? recipes = snapshot.value as List<dynamic>;
        recipes.shuffle();
        emit(CategoriesInitialState(
          recipe: recipes,
        ));
        
      }
    }
    );
    List<dynamic>? mainItem = state.recipe?.where((element) => element['category'] == event.category).toList();
    emit(CategoriesInitialState(recipe: mainItem ));
  }

  FutureOr<void> _currentPageIndex(
      CurrentPageIndexEvent event, Emitter<CategoriesState> emit) {
    emit(CategoriesInitialState(
      currentIndex: event.currentIndex,
      recipe: state.recipe,
    ));
  }
}
