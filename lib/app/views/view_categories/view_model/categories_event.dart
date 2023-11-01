abstract class CategoriesEvent {}

class CategoriesInitialEvent extends CategoriesEvent {
  String categoryName;
  CategoriesInitialEvent({required this.categoryName});
}

class CurrentPageIndexEvent extends CategoriesEvent{
  final int currentIndex;

  CurrentPageIndexEvent(this.currentIndex);
}