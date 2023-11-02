abstract class HomeState {
  List<dynamic>? recipes;
  List<dynamic>? favorites;
  HomeState({
    this.recipes,
    this.favorites
  });
}

class HomeInitialState extends HomeState {
  @override
  List<dynamic>? recipes;
  List<dynamic>? favorites = [];
  HomeInitialState({this.recipes, this.favorites})
      : super(
          recipes: recipes,
          favorites: favorites
        );
}