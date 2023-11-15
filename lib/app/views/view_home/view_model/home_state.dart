abstract class HomeState {
  List<dynamic>? recipe;
  List<dynamic>? favorites;
  HomeState({this.recipe, this.favorites});
}


class HomeInitialState extends HomeState {
  @override
  List<dynamic>? recipe;
  List<dynamic>? favorites = [];
  HomeInitialState({this.recipe, this.favorites})
      : super(recipe: recipe, favorites: favorites);
}

class FavoriteState extends HomeState{
   @override
  List<dynamic>? recipe;
  List<dynamic>? favorites = [];
  FavoriteState({this.recipe})
      : super(
          recipe: recipe,
        );
}
