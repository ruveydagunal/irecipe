import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:irecipe/core/extensions/context_extension.dart';


class CustomTextInput extends StatelessWidget {

  final label;
  // final String hintText;
  final Icon icon;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;

  const CustomTextInput(
      {super.key,
      required this.label,
      // required this.hintText,
      required this.icon,
      required this.controller,
      this.keyboardType,
      this.textInputAction,
      this.inputFormatters,
      this.validator
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          SizedBox(
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: controller,
              keyboardType: keyboardType ?? TextInputType.text,
              inputFormatters: inputFormatters,
              textInputAction: textInputAction ?? TextInputAction.next,
              validator: validator,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(context.lowRadius), borderSide: BorderSide(color: Theme.of(context).colorScheme.onBackground)),
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(context.lowRadius), borderSide: BorderSide(color: Theme.of(context).colorScheme.onBackground)),
                errorBorder: OutlineInputBorder(borderRadius: BorderRadius.all(context.lowRadius), borderSide: BorderSide(color: Theme.of(context).colorScheme.error)),
                disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(context.lowRadius), borderSide: BorderSide(color: Theme.of(context).colorScheme.onBackground)),
                focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.all(context.lowRadius), borderSide: BorderSide(color: Theme.of(context).colorScheme.error)),
                prefixIcon: icon,
                label: Text(label),
                // hintText: hintText,
              ),
            ),
          )
        ],
      ),
    );
  }
}


