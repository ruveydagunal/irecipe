

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:irecipe/app/l10n/app_localizations.dart';
import 'package:irecipe/app/views/view_recipes/view_model/recipes_event.dart';
import 'package:irecipe/app/views/view_recipes/view_model/recipes_state.dart';
import 'package:irecipe/app/views/view_recipes/view_model/recipes_view_model.dart';
import 'package:irecipe/app/views/view_recipes/widgets/recipes_widgets.dart';
import 'package:irecipe/core/constanst/color_constants.dart';
import 'package:irecipe/core/extensions/context_extension.dart';

@RoutePage()
class RecipeView extends StatelessWidget with RecipesWidgets {
  RecipeView({super.key});
 

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RecipesViewModel()..add(RecipesInitalEvent()),
      child: BlocConsumer<RecipesViewModel, RecipesState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                L10n.of(context)!.iRecipe,
              ),
            actions: [
              IconButton(onPressed: (){
                context.read<RecipesViewModel>().add(RecipesInitalEvent());
              }, icon: Icon(Icons.refresh))
            ],
            ),
            body: state.recipes == null ? Center(child: CircularProgressIndicator()) :  ListView.builder(
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
                          return SingleChildScrollView(
                            child: Padding(
                              padding: context.paddingNormal,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: context.width * 0.8,
                                        child: Text(
                                          state.recipes![index]['recipeName'],
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
                                          state.recipes![index]['imageLink'],
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
                                    physics: const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: state.recipes![index]['materials'].length,
                                    itemBuilder: (context, index2) {
                                      return Text(
                                        state.recipes![index]['materials'][index2],
                                        style: const TextStyle(fontSize: 16),
                                      );
                                    },
                                  ),
                                   Text(
                                    L10n.of(context)!.preparation,
                                    style: TextStyle(fontSize: 30),
                                  ),
                                  Text(
                                    state.recipes![index]['preparation'],
                                    style: const TextStyle(fontSize: 16),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: state.recipes![index]['imageLink'] != null
                        ? Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(state.recipes![index]['imageLink']),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                            ),
                            height: 250,
                            child: ValueListenableBuilder(
                              valueListenable: Hive.box('favorites').listenable(),
                              
                              builder: (context, box, child) {
                                return infoStack(context, state, index);
                                
                              },
                            ),
                          )
                        : Center(child: CircularProgressIndicator()),
                  ),
                );
              },
            ));
          
      },
      ),
    );
  }
}
