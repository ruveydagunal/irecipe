abstract class CategoriesState {
  List<dynamic>? recipe;
  int currentIndex;

  CategoriesState(this.currentIndex, {this.recipe} );
}

class CategoriesInitialState extends CategoriesState {
  @override
  List<dynamic>? recipe;
  CategoriesInitialState({this.recipe, })
      : super(recipe: recipe);
}

class CurrentPageIndexState extends CategoriesState{

  int currentIndex;

 CurrentPageIndexState(this.currentIndex);
}