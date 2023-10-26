import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:irecipe/app/router/app_router.dart';

@RoutePage()
class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      context.router.push(OnboardingViewRoute());
    });
    return Scaffold(
        body: Container(
          color: Colors.white,
      child: 
        Center(child: SvgPicture.asset('assets/images/svg/iRecipe.svg', height: 100,))
      
    ));
  }
}
