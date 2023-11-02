abstract class FavoriteState {
  List<dynamic>? recipes;
  
  FavoriteState({
    this.recipes,
    
  });
}

class FavoriteInitialState extends FavoriteState {
  @override
  List<dynamic>? recipes;
  List<dynamic>? favorites = [];
  FavoriteInitialState({this.recipes})
      : super(
          recipes: recipes,
          
        );
}