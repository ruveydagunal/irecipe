import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';



class OnboardingThridView extends StatelessWidget {
  const OnboardingThridView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 40.0, right: 20, left: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Lottie.asset('assets/lotties/animation_three.json'),
        ],
      ),
    ));
  }
}


