import 'package:auto_route/auto_route.dart';
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
          // Lottie.asset('asset/lottie/lottie_onboarding_second.json'),
          Text('Paylaştıklarınla insanlara ilham kaynağı ol',
              style:  TextStyle(color: Colors.brown, fontSize: 30)),
          // SizedBox(width: double.infinity, child: CustomButton(buttonText: 'Sonraki', onPressed: ()=>context.router.replaceAll([SignUpViewRoute()])))
        ],
      ),
    ));
  }
}


