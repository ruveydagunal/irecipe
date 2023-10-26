import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';



class OnboardingSecondView extends StatelessWidget {
  const OnboardingSecondView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 40.0, right: 20, left: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Lottie.asset('assets/lotties/animation_two.json'),
        ],
      ),
    ));
  }
}


