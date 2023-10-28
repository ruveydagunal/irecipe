import 'package:flutter/material.dart';
import 'package:irecipe/app/l10n/app_localizations.dart';
import 'package:irecipe/core/extensions/context_extension.dart';
import 'package:lottie/lottie.dart';



class OnboardingThridView extends StatelessWidget {
  const OnboardingThridView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: context.paddingMedium,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Lottie.asset('assets/lotties/animation_three.json'),
          Padding(
            padding: context.paddingMedium,
            child: Text(L10n.of(context)!.clickBegin , style: TextStyle(fontSize: 30),)
          )
        ],
      ),
    ));
  }
}


