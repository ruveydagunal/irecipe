import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:irecipe/app/l10n/app_localizations.dart';
import 'package:irecipe/app/views/view_favorite/view_model/favorite_event.dart';
import 'package:irecipe/app/views/view_favorite/view_model/favorite_state.dart';
import 'package:irecipe/app/views/view_favorite/view_model/favorite_view_model.dart';
import 'package:irecipe/app/views/view_favorite/widgets/favorite_widgets.dart';

import 'package:irecipe/core/constanst/color_constants.dart';
import 'package:irecipe/core/extensions/context_extension.dart';
import 'package:irecipe/core/repository/service/auth_service.dart';

import 'package:uuid/uuid.dart';

@RoutePage()
class FavoriteView extends StatelessWidget with FavoriteWidgets {
  FavoriteView({super.key});
  AuthService authService = AuthService();

  Uuid uuid = const Uuid();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoriteViewModel()..add(FavoriteInitialEvent()),
      child: BlocConsumer<FavoriteViewModel, FavoriteState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                L10n.of(context)!.favorites,
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      context
                          .read<FavoriteViewModel>()
                          .add(FavoriteInitialEvent());
                    },
                    icon: Icon(Icons.refresh))
              ],
            ),
            body: ListView.builder(
              
              shrinkWrap: true,
              itemCount: state.recipes!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: context.horizontalPaddingConstNormal +
                      context.onlyTopPaddingMedium,
                  child: GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        isDismissible: false,
                        useSafeArea: true,
                        isScrollControlled: true,
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: context.paddingNormal,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: context.width * 0.8,
                                      child: Text(
                                        state.recipes![index][0],
                                        style: const TextStyle(fontSize: 35),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        context.router.pop();
                                      },
                                      icon: Icon(Icons.clear),
                                    )
                                  ],
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        state.recipes![index][1],
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                    color: ColorConstants.primaryColor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  height: 250,
                                ),
                                Text(
                                  L10n.of(context)!.materials,
                                  style: TextStyle(fontSize: 30),
                                ),
                                ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: state.recipes![index][2].length,
                                  itemBuilder: (context, index2) {
                                    return Text(
                                      state.recipes![index][2][index2],
                                      style: const TextStyle(fontSize: 16),
                                    );
                                  },
                                ),
                                Text(
                                  L10n.of(context)!.preparation,
                                  style: TextStyle(fontSize: 30),
                                ),
                                Text(
                                  state.recipes![index][3],
                                  style: const TextStyle(fontSize: 16),
                                )
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: state.recipes![index][1] != null
                        ? Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(state.recipes![index][1]),
                                fit: BoxFit.cover,
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                            ),
                            height: 250,
                            child: ValueListenableBuilder(
                              valueListenable:
                                  Hive.box('favorites').listenable(),
                              builder: (context, box, child) {
                                return infoStack(context, state, index);
                              },
                            ),
                          )
                        : Center(child: CircularProgressIndicator()),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
