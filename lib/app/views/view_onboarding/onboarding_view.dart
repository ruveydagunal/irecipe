import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:irecipe/app/views/view_onboarding/onboarding_first_view.dart';
import 'package:irecipe/app/views/view_onboarding/onboarding_second_view.dart';
import 'package:irecipe/app/views/view_onboarding/view_model/onboarding_state.dart';
import 'package:irecipe/app/views/view_onboarding/view_model/onboarding_view_model.dart';


@RoutePage()
class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => OnboardingViewModel(),
    child: BlocBuilder<OnboardingViewModel, OnboardingState>(builder: (context, state) {
      return Scaffold(
        body: SafeArea(child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               SizedBox(
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: bodyWidget(state),
                  ),
             
        
            ],
          ),
        )),
      );
    },) ,
    );
    
  }

    Widget bodyWidget(OnboardingState state) {
    if (state.currentIndex == 0) {
      return OnboardingFirstView();
    } else if (state.currentIndex == 1) {
      return  OnboardingSecondView();
    }  else {
      return Container();
    }
  }
}