import 'package:flutter/material.dart';



class OnboardingFirstView extends StatelessWidget {
  const OnboardingFirstView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 40.0, right: 20, left: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Lottie.asset('asset/lottie/lottie_onboarding_first.json'),
          Text('Hedeflerini ve hayallerini insanlarla paylaş',
              style:  TextStyle(color: Colors.brown, fontSize: 30)),
          // SizedBox(width: double.infinity, child: CustomButton(buttonText: 'Sonraki', onPressed: (){
          //   // context.router.push(OnboardingSecondViewRoute());
          // }))
        ],
      ),
    ));
  }
}


