import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:irecipe/app/views/view_onboarding/view_model/onboarding_event.dart';
import 'package:irecipe/app/views/view_onboarding/view_model/onboarding_state.dart';

class OnboardingViewModel extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingViewModel() : super(OnboardingState(0)) {
    on<CurrentPageIndexEvent>(_currentPageIndex);
  }

  FutureOr<void> _currentPageIndex(
      CurrentPageIndexEvent event, Emitter<OnboardingState> emit) {
    emit(OnboardingState(event.currentIndex));
  }
}
