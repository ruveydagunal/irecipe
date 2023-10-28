import 'package:flutter/material.dart';
import 'package:irecipe/core/constanst/color_constants.dart';
import 'package:irecipe/core/extensions/context_extension.dart';

mixin SettingsWidget {
  Widget settingsContainer({
    required BuildContext context,
    required String text,
    required IconData suffixIcon,
    required VoidCallback onPressed,
    Widget? prefixIcon,
  }) {
    return Center(
        child: Padding(
      padding: context.paddingNormal,
      child: SizedBox(
        height: 60,
        child: ElevatedButton(
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(suffixIcon, color: ColorConstants.textLight),
                  context.sizedWidthBoxLow,
                  Text(
                    text,
                    style: TextStyle(
                        color: ColorConstants.textLight, fontSize: 20),
                  )
                ],
              ),
              prefixIcon ??
                  Icon(Icons.arrow_forward_ios_outlined,
                      color: ColorConstants.textLight)
            ],
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorConstants.containerColorLight,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ),
    ));
  }

  Widget profileInfoContainer({String? initialValue, required String label }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(label: Text(label)),
       initialValue: initialValue,
       readOnly: true,
      ),
    );
  }
}
