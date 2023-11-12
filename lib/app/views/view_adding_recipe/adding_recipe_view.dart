
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:irecipe/app/l10n/app_localizations.dart';
import 'package:irecipe/core/extensions/context_extension.dart';
import 'package:irecipe/core/widgets/custom_button.dart';
import 'package:irecipe/core/widgets/custom_input.dart';

@RoutePage()
class AddingRecipeView extends StatelessWidget {
  AddingRecipeView({super.key});
  TextEditingController recipeName =  TextEditingController();
  TextEditingController materials =  TextEditingController();
  TextEditingController preparation =  TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adding Recipe'),
      ),
      body: Column(
        children: [
          Padding(
            padding: context.paddingLow,
            child: CustomTextInput(
              controller: recipeName,
              icon: Icon(Icons.restaurant),
              label: L10n.of(context)!.foodName,
            ),
          ),
          Padding(
            padding: context.paddingLow,
            child: CustomTextInput(
              controller: materials,
              icon: Icon(Icons.list),
              label: L10n.of(context)!.materials,
            ),
          ),
          Padding(
            padding: context.paddingLow,
            child: CustomTextInput(
              controller: preparation,
              icon: Icon(Icons.restaurant),
              label: L10n.of(context)!.preparation,
            ),
          ),
          Padding(
            padding: context.paddingLow,
            child: CustomTextInput(
              controller: preparation,
              icon: Icon(Icons.image),
              label: 'Image Link'
            ),
          ),
          Padding(
            padding: context.paddingLow,
            child: CustomButton(buttonText: L10n.of(context)!.add, onPressed: (){}),
          ),
          
        ],
      ),
    );
  }
}
