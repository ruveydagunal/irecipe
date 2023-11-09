import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:irecipe/app/l10n/app_localizations.dart';
import 'package:irecipe/app/views/view_categories/detail_view.dart';
import 'package:irecipe/app/views/view_categories/view_model/categories_event.dart';
import 'package:irecipe/app/views/view_categories/view_model/categories_state.dart';
import 'package:irecipe/app/views/view_categories/view_model/categories_view_model.dart';
import 'package:irecipe/app/views/view_categories/widget/categories_widgets.dart';

import 'package:irecipe/core/extensions/context_extension.dart';
import 'package:irecipe/gen/assets.gen.dart';

@RoutePage()
class CategoriesView extends StatelessWidget with CategoriesWidget {
  CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => CategoriesViewModel(),
        child: BlocConsumer<CategoriesViewModel, CategoriesState>(
          listener: (context, state) {},
          builder: (context, state) {
            return bodyWidget(state, context);
          },
        ));
  }

  Widget categoryWidget(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
          L10n.of(context)!.categories,
        )),
        body: Padding(
          padding: context.paddingNormal,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    categoriesContainer(context, () {
                      context.read<CategoriesViewModel>().add(
                          CategoriesInitialEvent(
                              category: 'main', currentIndex: 1));
                    }, Assets.images.jpg.main.path),
                    categoriesContainer(context, () {
                      context.read<CategoriesViewModel>().add(
                          CategoriesInitialEvent(
                              category: 'dessert', currentIndex: 1));
                    }, Assets.images.jpg.desserts.path)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    categoriesContainer(context, () {
                      context.read<CategoriesViewModel>().add(
                          CategoriesInitialEvent(
                              category: 'soup', currentIndex: 1));
                    }, Assets.images.jpg.soaps.path),
                    categoriesContainer(context, () {
                      context.read<CategoriesViewModel>().add(
                          CategoriesInitialEvent(
                              category: 'salad', currentIndex: 1));
                    }, Assets.images.jpg.salads.path)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    categoriesContainer(context, () {
                      context.read<CategoriesViewModel>().add(
                          CategoriesInitialEvent(
                              category: 'pastry', currentIndex: 1));
                    }, Assets.images.jpg.cake.path),
                    categoriesContainer(context, () {
                      context.read<CategoriesViewModel>().add(
                          CategoriesInitialEvent(
                              category: 'appetizer', currentIndex: 1));
                    }, Assets.images.jpg.appetizers.path)
                  ],
                )
              ],
            ),
          ),
        ));
  }

  Widget bodyWidget(CategoriesState state, BuildContext context) {
    if (state.currentIndex == 0) {
      return categoryWidget(context);
    } else {
      return CategoryDetailView();
    }
  }
}
