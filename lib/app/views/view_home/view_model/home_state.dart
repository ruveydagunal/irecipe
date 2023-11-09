abstract class HomeState {
  List<dynamic>? recipe_en;
  List<dynamic>? favorites;
  HomeState({this.recipe_en, this.favorites});
}

class HomeInitialState extends HomeState {
  @override
  List<dynamic>? recipe_en;
  List<dynamic>? favorites = [];
  HomeInitialState({this.recipe_en, this.favorites})
      : super(recipe_en: recipe_en, favorites: favorites);
}

class FavoriteState extends HomeState{
   @override
  List<dynamic>? recipe_en;
  List<dynamic>? favorites = [];
  FavoriteState({this.recipe_en})
      : super(
          recipe_en: recipe_en,
          
        );
}
