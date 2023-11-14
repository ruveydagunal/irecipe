import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:irecipe/app/l10n/app_localizations.dart';
import 'package:irecipe/app/views/view_adding_recipe/view_model/adding_recipe_event.dart';
import 'package:irecipe/app/views/view_adding_recipe/view_model/adding_recipe_state.dart';
import 'package:irecipe/app/views/view_adding_recipe/view_model/adding_recipe_view_model.dart';
import 'package:irecipe/core/extensions/context_extension.dart';
import 'package:irecipe/core/widgets/custom_button.dart';
import 'package:irecipe/core/widgets/custom_input.dart';


@RoutePage()
class AddingRecipeView extends StatelessWidget {
  AddingRecipeView({super.key});

@override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddingRecipeViewModel(),
      child: BlocBuilder<AddingRecipeViewModel, AddingRecipeState>(builder: (context, state) {
        return Form(
          key: context.read<AddingRecipeViewModel>().formKey,
          child: Scaffold(
            resizeToAvoidBottomInset: true,
              appBar: AppBar(
          title: const Text('Adding Recipe'),
              ),
              body: SingleChildScrollView(
                child: Column(
                        children: [
                          Padding(
                padding: context.paddingLow,
                child: CustomTextInput(
                  controller: context.read<AddingRecipeViewModel>().recipeNameController,
                  icon: Icon(Icons.restaurant),
                  label: L10n.of(context)!.foodName,
                  hintText: L10n.of(context)!.foodName,
                                                validator: (value) {
                                  if (context
                                      .read<AddingRecipeViewModel>()
                                      .recipeNameController
                                      .text
                                      .isEmpty) {
                                    return L10n.of(context)!.foodNameMessage;
                                  }
                                  return null;
                                }
                ),
                          ),
                          Padding(
                padding: context.paddingLow,
                child: CustomTextInput(
                  controller: context.read<AddingRecipeViewModel>().materialsController,
                  icon: Icon(Icons.list),
                  label: L10n.of(context)!.materials,
                  hintText: 'xxx, xxx, xxx',
                  validator: (value) {
                                  if (context
                                      .read<AddingRecipeViewModel>()
                                      .materialsController
                                      .text
                                      .isEmpty) {
                                    return L10n.of(context)!.materialsMessage;
                                  }
                                  return null;
                                },
                ),
                          ),
                          Padding(
                padding: context.paddingLow,
                child: CustomTextInput(
                  controller: context.read<AddingRecipeViewModel>().preparationController,
                  icon: Icon(Icons.restaurant),
                  label: L10n.of(context)!.preparation,
                  hintText: L10n.of(context)!.preparation,
                  validator: (value) {
                                  if (context
                                      .read<AddingRecipeViewModel>()
                                      .preparationController
                                      .text
                                      .isEmpty) {
                                    return L10n.of(context)!.preparationMessage;
                                  }
                                  return null;
                                },
                ),
                          ),
                          Padding(
                padding: context.paddingLow,
                child: CustomTextInput(
                  controller: context.read<AddingRecipeViewModel>().imageLinkController,
                  icon: Icon(Icons.image),
                  label: L10n.of(context)!.imageLink,
                  hintText: L10n.of(context)!.exampleLink,
                  validator: (value) {
                                  if (context
                                      .read<AddingRecipeViewModel>()
                                      .imageLinkController
                                      .text
                                      .isEmpty) {
                                    return L10n.of(context)!.imageLinkMessage;
                                  }
                                  return null;
                                },
                ),
                          ),
                          Padding(
                padding: context.paddingLow,
                child: CustomButton(
                  buttonText: L10n.of(context)!.add,
                  onPressed: (){
                    if (context
                                      .read<AddingRecipeViewModel>()
                                      .formKey
                                      .currentState!
                                      .validate()) {
                                    context
                                        .read<AddingRecipeViewModel>()
                                        .add(AddingRecipeInitalEvent(context));
                                  } else {
                                    return;
                                  }
                  },
                ),
                          ),
                        ],
                ),
              ),
            ),
        );
      },)
    );
  }
}

  
