import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:irecipe/app/router/app_router.dart';
import 'package:lottie/lottie.dart';

@RoutePage()
class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      context.router.push(OnboardingViewRoute());
    });
    return Scaffold(
        body: Column(
      children: [
        // Padding(
        //   padding: const EdgeInsets.only(left: 60, right: 60, top: 300),
        //   child: Lottie.asset('asset/lottie/lottie_splash.json'),
        // ),
        Text('iRecipe',
            style: GoogleFonts.lobsterTwo(
                textStyle: TextStyle(color: Colors.brown, fontSize: 60)))
      ],
    ));
  }
}
