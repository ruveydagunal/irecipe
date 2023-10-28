import 'package:flutter/material.dart';
import 'package:irecipe/app/l10n/app_localizations.dart';
import 'package:irecipe/core/extensions/context_extension.dart';
import 'package:lottie/lottie.dart';



class OnboardingSecondView extends StatelessWidget {
  const OnboardingSecondView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: context.paddingMedium,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Lottie.asset('assets/lotties/animation_two.json'),
              Padding(
                padding: context.paddingMedium,
                child: Text(L10n.of(context)!.awaitYou, style: TextStyle(fontSize: 30),),
              )
            ],
          ),
        ));
  }
}


