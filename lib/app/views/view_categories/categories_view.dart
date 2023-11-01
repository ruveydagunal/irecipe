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
                                    CurrentPageIndexEvent(
                                        state.currentIndex + 1));
                            }),
                            categoriesContainer(context, () {})
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            categoriesContainer(context, () {}),
                            categoriesContainer(context, () {})
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            categoriesContainer(context, () {}),
                            categoriesContainer(context, () {})
                          ],
                        )
                      ],
                    ),
                  ),
                ));
          },
        ));
  }

   Widget bodyWidget(CurrentPageIndexState state) {
    if (state.currentIndex == 0) {
      return DetailView();
    } else {
      return Container();
    }
  }
}
