import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:irecipe/app/views/view_favorite/view_model/favorite_event.dart';
import 'package:irecipe/app/views/view_favorite/view_model/favorite_state.dart';

class FavoriteViewModel extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteViewModel() : super(FavoriteInitialState(recipes: [])) {
    on<FavoriteInitialEvent>(_initial);
  }


  Future<FutureOr<void>> _initial(
      FavoriteInitialEvent event, Emitter<FavoriteState> emit) async {
        
        var userBox = Hive.box('userLocalDB');

        var recipes = userBox.get('favorites', defaultValue: []);
        emit(FavoriteInitialState(recipes: recipes));
  }
}