import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:irecipe/app/router/app_router.dart';
import 'package:irecipe/app/views/view_onboarding/onboarding_first_view.dart';
import 'package:irecipe/app/views/view_onboarding/onboarding_second_view.dart';
import 'package:irecipe/app/views/view_onboarding/onboarding_thrid_view.dart';
import 'package:irecipe/app/views/view_onboarding/view_model/onboarding_event.dart';
import 'package:irecipe/app/views/view_onboarding/view_model/onboarding_state.dart';
import 'package:irecipe/app/views/view_onboarding/view_model/onboarding_view_model.dart';
import 'package:irecipe/core/extensions/context_extension.dart';
import 'package:irecipe/core/widgets/custom_button.dart';


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
             Padding(
                padding:  context.paddingNormal,
                child: SizedBox(width: double.infinity, child: CustomButton(buttonText: 'Sonraki', onPressed: (){
                  if(state.currentIndex<2){
                    context
                          .read<OnboardingViewModel>()
                          .add(CurrentPageIndexEvent(state.currentIndex + 1));
                  }else{
                    context.router.replaceAll([SignUpViewRoute()]);
                  }
                })),
              )
        
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
    } else if (state.currentIndex == 2) {
      return  OnboardingThridView(); 
    }else {
      return Container();
    }}
}