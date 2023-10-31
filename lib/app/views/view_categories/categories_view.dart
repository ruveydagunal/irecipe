import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:irecipe/app/l10n/app_localizations.dart';

import 'package:irecipe/core/extensions/context_extension.dart';

@RoutePage()
class CategoriesView extends StatelessWidget {
  CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(L10n.of(context)!.categories,)
        ),
        body: Padding(
          padding: context.paddingNormal,
          child: GridView.builder(
            itemCount: 10,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.orange[800],
                ),
              );
            },
          ),
        ));
  }
}
