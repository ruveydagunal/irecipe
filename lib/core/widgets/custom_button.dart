import 'package:flutter/material.dart';
import 'package:irecipe/core/constanst/color_constants.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  const CustomButton(
      {super.key, required this.buttonText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 200,
      child: ElevatedButton(
          onPressed: onPressed,
          child: Text(
            buttonText,
            style: TextStyle(color: ColorConstants.textDark, fontSize: 20),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).primaryColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10) )
            
          )),
    );
  }
}
