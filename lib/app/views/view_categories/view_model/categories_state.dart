abstract class CategoriesState {
  List<dynamic>? recipe;
  int? currentIndex;

  CategoriesState({this.currentIndex = 0, this.recipe});
}

class CategoriesInitialState extends CategoriesState {
  @override
  List<dynamic>? recipe;
  int? currentIndex;

  CategoriesInitialState({this.recipe, this.currentIndex})
      : super(recipe: recipe, currentIndex: currentIndex);
}
