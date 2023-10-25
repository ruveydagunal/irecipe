abstract class OnboardingEvent{}

class OnboardingInitial extends OnboardingEvent {}

class CurrentPageIndexEvent extends OnboardingEvent{
  final int currentIndex;

  CurrentPageIndexEvent(this.currentIndex);
}