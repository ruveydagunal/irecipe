import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:irecipe/app/views/view_home/view_model/home_state.dart';
import 'package:irecipe/core/constanst/color_constants.dart';
import 'package:irecipe/core/extensions/context_extension.dart';

mixin HomeWidgets {
  Widget infoStack(BuildContext context, HomeState state, int index) {
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: Colors.orange[100]),
              height: 40,
              child: Padding(
                padding: context.horizontalPaddingLow,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: context.width * 0.7,
                      child: Text(
                        state.recipe![index]['foodName'],
                        style: context.textTheme.headlineSmall!.copyWith(color: ColorConstants.textLight),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          var userBox = Hive.box('userLocalDB');
                          print("hiveeee: ${userBox.get('favorites')}");
                          var favorite =
                              userBox.get('favorites', defaultValue: []);
                          favorite.add([
                            state.recipe![index]['foodName'],
                            state.recipe![index]['image'],
                            state.recipe![index]['materials'],
                            state.recipe![index]['recipe'],
                          ]);
                          userBox.put('favorites', favorite);
                        },
                        icon: Icon(
                          Icons.favorite_outline, color: ColorConstants.textLight
                        ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
