abstract class CategoriesEvent {}

class CategoriesInitialEvent extends CategoriesEvent {
  String category;
  final int currentIndex;
  CategoriesInitialEvent(
      {required this.category, required this.currentIndex});
}

class CurrentPageIndexEvent extends CategoriesEvent {
  final int currentIndex;

  CurrentPageIndexEvent(this.currentIndex);
}
