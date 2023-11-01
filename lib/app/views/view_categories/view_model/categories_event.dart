abstract class CategoriesEvent {}

class CategoriesInitialEvent extends CategoriesEvent {
  String categoryName;
  final int currentIndex;
  CategoriesInitialEvent(
      {required this.categoryName, required this.currentIndex});
}

class CurrentPageIndexEvent extends CategoriesEvent {
  final int currentIndex;

  CurrentPageIndexEvent(this.currentIndex);
}
