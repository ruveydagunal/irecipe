import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:irecipe/app/l10n/app_localizations.dart';
import 'package:irecipe/core/extensions/context_extension.dart';

class CustomPasswordTextField extends StatefulWidget {
  const CustomPasswordTextField(
      {Key? key, this.controller, this.validator, this.inputFormatters})
      : super(key: key);
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  @override
  State<CustomPasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<CustomPasswordTextField> {
  final _obsureText = '*';

  bool _isSecure = true;

  void _changeLoading() {
    setState(() {
      _isSecure = !_isSecure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.verticalPaddingConstLow,
      child: TextFormField(
        textInputAction: TextInputAction.done,
        controller: widget.controller,
        autofillHints: const [AutofillHints.password],
        keyboardType: TextInputType.visiblePassword,
        obscureText: _isSecure,
        obscuringCharacter: _obsureText,
        validator: widget.validator,
        inputFormatters: widget.inputFormatters,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(context.lowRadius),
              borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.onBackground)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(context.lowRadius),
              borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.onBackground)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(context.lowRadius),
              borderSide:
                  BorderSide(color: Theme.of(context).colorScheme.error)),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(context.lowRadius),
              borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.onBackground)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(context.lowRadius),
              borderSide:
                  BorderSide(color: Theme.of(context).colorScheme.error)),
          prefixIcon: Icon(Icons.key_outlined),
          suffixIcon: _onVisiblityIcon(),
          labelText: L10n.of(context)!.password,
          // hintText: hintText,
        ),
      ),
    );
  }

  IconButton _onVisiblityIcon() {
    return IconButton(
      onPressed: _changeLoading,
      icon: AnimatedCrossFade(
        duration: const Duration(milliseconds: 500),
        firstChild: const Icon(Icons.visibility_outlined),
        secondChild: const Icon(Icons.visibility_off_outlined),
        crossFadeState:
            _isSecure ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      ),
    );
  }
}
