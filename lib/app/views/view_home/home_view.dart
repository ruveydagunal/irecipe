import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:irecipe/app/router/app_router.dart';
import 'package:irecipe/app/views/view_splash/splash_view.dart';
import 'package:irecipe/core/repository/service/auth_service.dart';
import 'package:irecipe/core/widgets/snackbar_widget.dart';
import 'package:super_toast/super_toast.dart';

import 'package:uuid/uuid.dart';

@RoutePage()
class HomeView extends StatelessWidget {
  HomeView({super.key});
  AuthService authService = AuthService();

  Uuid uuid = const Uuid();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: ()  {
                context.router.push(SettingsViewRoute());
              },
              icon: const Icon(Icons.settings_outlined))
        ],
        title: const Text('HomeView'),
      ),
      body: Column(
        children: [
          IconButton(onPressed: (){
            context.router.push(FavoriteViewRoute());
          }, icon: Icon(Icons.favorite_border))
        ],
      ),
    );
  }
}
