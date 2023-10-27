import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:irecipe/app/views/view_splash/splash_view.dart';
import 'package:irecipe/core/repository/service/auth_service.dart';
import 'package:irecipe/core/widgets/snackbar_widget.dart';

import 'package:uuid/uuid.dart';

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
              onPressed: () async {
                await authService.signOut();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    content: SnackBarWidget.info(
                      subTitle: 'Çıkış yapılıyor...',
                    )));
    
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SplashView()));
              },
              icon: const Icon(Icons.logout))
        ],
        title: const Text('SettingsView'),
      ),
    );
  }
}
