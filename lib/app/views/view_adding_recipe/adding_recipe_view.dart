
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:irecipe/core/widgets/custom_input.dart';

@RoutePage()
class AddingRecipeView extends StatelessWidget {
  AddingRecipeView({super.key});

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adding Recipe'),
      ),
      body: Column(
        children: [
          // CustomTextInput(
            
          //   icon: Icon(Icons.email_outlined),
          //   label: 'Yemek ismi',
          // )
        ],
      ),
    );
  }
}
