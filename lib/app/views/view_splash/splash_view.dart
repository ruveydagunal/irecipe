import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:irecipe/app/views/view_splash/view_model/splash_event.dart';
import 'package:irecipe/app/views/view_splash/view_model/splash_state.dart';
import 'package:irecipe/app/views/view_splash/view_model/splash_view_model.dart';
import 'package:irecipe/core/extensions/context_extension.dart';
import 'package:irecipe/gen/assets.gen.dart';

@RoutePage()
class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashViewModel()..add(SplashInitialEvent(context)),
      child:
          BlocBuilder<SplashViewModel, SplashState>(builder: (context, state) {
        return Scaffold(
            body: Container(
                color: Theme.of(context).scaffoldBackgroundColor,
                child: Center(
                    child: SvgPicture.asset(
                  Assets.images.svg.iRecipe,
                  height: context.height * .3
                ))));
      }),
    );
  }
}
