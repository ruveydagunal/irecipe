abstract class RecipesState {
  List<dynamic>? recipes;

  RecipesState({this.recipes});
}

class RecipesInitialState extends RecipesState {
  @override
  List<dynamic>? recipes;
  RecipesInitialState({this.recipes})
      : super(recipes: recipes);
}

