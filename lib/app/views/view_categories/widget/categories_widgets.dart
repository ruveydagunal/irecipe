import 'package:flutter/material.dart';
import 'package:irecipe/core/extensions/context_extension.dart';
import 'package:irecipe/gen/assets.gen.dart';

mixin CategoriesWidget {
  Widget categoriesContainer(
      BuildContext context, VoidCallback onTap, String recipeImage) {
    return Padding(
        padding: context.paddingLow,
        child: GestureDetector(
          onTap: onTap,
          child: Container(
              alignment: Alignment.center,
              width: context.width * 0.42,
              height: context.height * 0.2,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(recipeImage), fit: BoxFit.cover),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                color: Colors.orange[800],
              ),
          )
        ));
  }
}
