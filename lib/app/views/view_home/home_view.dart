
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:irecipe/app/router/app_router.dart';
import 'package:irecipe/core/extensions/context_extension.dart';
import 'package:irecipe/core/repository/service/auth_service.dart';


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
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
        return Padding(
           padding: context.horizontalPaddingConstNormal + context.onlyTopPaddingMedium,
           child: GestureDetector(
              onTap: () {
                context.router.push(DetailViewRoute());
              },
             child: Container(
               decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)), color: Colors.orange[800],),
               height: 250,
             ),
           ),
         );
      },),
    );
  }
}
