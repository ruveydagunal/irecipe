import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:irecipe/app/l10n/app_localizations.dart';
import 'package:irecipe/core/extensions/context_extension.dart';

@RoutePage()
class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(L10n.of(context)!.myFavorites,),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
        return Padding(
              padding: context.horizontalPaddingConstNormal + context.onlyTopPaddingMedium,
              child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)), color: Colors.orange[800],),
                height: 150,
              ),
            );
      },)
    );
  }
}
