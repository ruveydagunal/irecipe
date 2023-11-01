import 'package:flutter/material.dart';
import 'package:irecipe/core/extensions/context_extension.dart';

mixin CategoriesWidget {
  Widget categoriesContainer(BuildContext context, VoidCallback onTap) {
    return Padding(padding: context.paddingLow ,
    child:    GestureDetector(
                          onTap: onTap,
                          child: Container(
                            width: context.width * 0.42,
                            height: context.height * 0.25,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Colors.orange[800],
                            ),
                          ),
                        )
    );
  }

 

} 