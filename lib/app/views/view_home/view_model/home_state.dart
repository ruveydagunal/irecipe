abstract class HomeState {
  List<dynamic>? recipes;
  HomeState({
    this.recipes,
  });
}

class HomeInitialState extends HomeState {
  @override
  List<dynamic>? recipes;
  HomeInitialState({this.recipes})
      : super(
          recipes: recipes,
        );
}