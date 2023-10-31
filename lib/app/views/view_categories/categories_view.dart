import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:irecipe/core/extensions/context_extension.dart';

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
            // mainAxisSpacing: 0.01,
            // crossAxisSpacing: 0.01,
            // childAspectRatio: 1,
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
