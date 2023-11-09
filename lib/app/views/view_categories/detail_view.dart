import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:irecipe/app/l10n/app_localizations.dart';
import 'package:irecipe/app/views/view_categories/view_model/categories_event.dart';
import 'package:irecipe/app/views/view_categories/view_model/categories_state.dart';
import 'package:irecipe/app/views/view_categories/view_model/categories_view_model.dart';
import 'package:irecipe/core/constanst/color_constants.dart';
import 'package:irecipe/core/extensions/context_extension.dart';
import 'package:irecipe/core/repository/service/auth_service.dart';

import 'package:uuid/uuid.dart';


class CategoryDetailView extends StatelessWidget {
  CategoryDetailView({super.key});
  AuthService authService = AuthService();

  Uuid uuid = const Uuid();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesViewModel, CategoriesState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  context
                      .read<CategoriesViewModel>()
                      .add(CurrentPageIndexEvent(0));
                },
                icon: const Icon(Icons.arrow_back)),
            title: Text(
              L10n.of(context)!.iRecipe,
            ),
          ),
          body: ListView.builder(
            shrinkWrap: true,
            itemCount: state.recipe!.length,
            itemBuilder: (context, index) {
              // print("state : " + state.recipe![index]['image']);
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
                            return SingleChildScrollView(
                              child: Padding(
                                padding: context.paddingNormal,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          state.recipe![index]['foodName'],
                                          style:
                                              (const TextStyle(fontSize: 35)),
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              context.router.pop();
                                            },
                                            icon: Icon(Icons.clear))
                                      ],
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(state
                                                  .recipe![index]['image']),
                                              fit: BoxFit.cover),
                                          color: ColorConstants.primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      height: 250,
                                    ),
                                     Text(
                                      L10n.of(context)!.materials,
                                      style: (TextStyle(fontSize: 30)),
                                    ),
                                    ListView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: state
                                          .recipe![index]['materials'].length,
                                      itemBuilder: (
                                        context,
                                        index2,
                                      ) {
                                        return Text(
                                            state.recipe![index]['materials']
                                                [index2],
                                            style: (const TextStyle(
                                                fontSize: 16)));
                                      },
                                    ),
                                     Text(
                                      L10n.of(context)!.preparation,
                                      style: (TextStyle(fontSize: 30)),
                                    ),
                                    Text(
                                      state.recipe![index]['recipe'],
                                      style: const TextStyle(fontSize: 16),
                                    )
                                  ],
                                ),
                              ),
                            );
                          });
                    },
                    child: state.recipe![index]['image'] != null
                        ? Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      state.recipe![index]['image']),
                                  fit: BoxFit.cover),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                            ),
                            height: 250,
                            child: Stack(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  // crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10)),
                                          color: Colors.orange[100]),
                                      height: 40,
                                      child: Padding(
                                        padding: context.horizontalPaddingLow,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: context.width * 0.7,
                                              child: Text(
                                                state.recipe![index]
                                                    ['foodName'],
                                                style: context
                                                    .textTheme.headlineSmall!.copyWith(color: ColorConstants.textLight),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            IconButton(
                                                onPressed: () {},
                                                icon: Icon(
                                                  Icons.favorite_outline,color: ColorConstants.textLight,
                                                ))
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ))
                        : Center(child: CircularProgressIndicator())),
              );
            },
          ),
        );
      },
    );
  }
}
