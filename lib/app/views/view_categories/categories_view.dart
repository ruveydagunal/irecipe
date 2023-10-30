import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:irecipe/app/router/app_router.dart';
import 'package:irecipe/app/views/view_splash/splash_view.dart';
import 'package:irecipe/core/extensions/context_extension.dart';
import 'package:irecipe/core/repository/service/auth_service.dart';
import 'package:irecipe/core/widgets/bottom_navigation.dart';
import 'package:irecipe/core/widgets/snackbar_widget.dart';
import 'package:super_toast/super_toast.dart';

import 'package:uuid/uuid.dart';

@RoutePage()
class CategoriesView extends StatelessWidget {
  CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Kategoriler'),
        ),
        body: GridView.builder(
          itemCount: 10,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 0.1,
            crossAxisSpacing: 0.1,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            return Padding(
              padding: context.horizontalPaddingConstNormal +
                  context.onlyTopPaddingMedium,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.orange[800],
                ),
              ),
            );
          },
        ));
  }
}
