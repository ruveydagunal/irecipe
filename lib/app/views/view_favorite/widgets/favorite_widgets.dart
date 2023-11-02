import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:irecipe/app/views/view_favorite/view_model/favorite_event.dart';
import 'package:irecipe/app/views/view_favorite/view_model/favorite_state.dart';
import 'package:irecipe/app/views/view_favorite/view_model/favorite_view_model.dart';
import 'package:irecipe/core/constanst/color_constants.dart';
import 'package:irecipe/core/extensions/context_extension.dart';

mixin FavoriteWidgets {
  Widget infoStack(BuildContext context, FavoriteState state, int index) {
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
                        state.recipes![index][0],
                        style: context.textTheme.headlineSmall!.copyWith(color: ColorConstants.textLight),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          var userBox = Hive.box('userLocalDB');
                          List<dynamic> favorite =
                              userBox.get('favorites', defaultValue: []);
                          print("userbox: ${favorite}");
                          favorite.remove(state.recipes![index]);
                          userBox.put('favorites', favorite);
                          context.read<FavoriteViewModel>().add(FavoriteInitialEvent());
                        },
                        icon: Icon(
                          Icons.favorite,color: ColorConstants.textLight,
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
