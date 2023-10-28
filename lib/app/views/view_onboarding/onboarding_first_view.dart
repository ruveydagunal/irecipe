import 'package:flutter/material.dart';
import 'package:irecipe/app/l10n/app_localizations.dart';
import 'package:irecipe/gen/assets.gen.dart';
import 'package:lottie/lottie.dart';
import 'package:irecipe/core/extensions/context_extension.dart';




class OnboardingFirstView extends StatelessWidget {
  const OnboardingFirstView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: context.paddingMedium,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Lottie.asset(Assets.lotties.animationCut),
              Padding(
                padding: context.paddingMedium,
                child: Text(L10n.of(context)!.takeStepWorldMeals, style: TextStyle(fontSize: 30),),
              )
            ],
          ),
        ));
  }
}


