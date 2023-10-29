import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:irecipe/app/l10n/app_localizations.dart';
import 'package:irecipe/app/router/app_router.dart';
import 'package:irecipe/app/theme/light_theme.dart';
import 'package:irecipe/app/views/view_signup/view_model/signup_event.dart';
import 'package:irecipe/app/views/view_signup/view_model/signup_state.dart';
import 'package:irecipe/app/views/view_signup/view_model/signup_view_model.dart';
import 'package:irecipe/core/extensions/context_extension.dart';
import 'package:irecipe/core/widgets/custom_button.dart';
import 'package:irecipe/core/widgets/custom_input.dart';
import 'package:irecipe/core/widgets/password_input.dart';

@RoutePage()
class SignUpView extends StatelessWidget {
  SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => SignUpViewModel(),
    child: BlocBuilder<SignUpViewModel, SignUpState>(builder: (context, state) {
      return Form(
        key:context.read<SignUpViewModel>().formKey,
        child: Scaffold(
          body: SafeArea(
        child: Padding(
          padding: context.paddingNormal,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(L10n.of(context)!.signUp,
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 40,
                        fontWeight: FontWeight.w500)),
                Row(
                  children: [
                     Text(L10n.of(context)!.doHaveAccount, style: TextStyle(fontSize: 16)),
                    TextButton(
                        onPressed: () => context.router.push(SignInViewRoute()),
                        child: Text(
                          L10n.of(context)!.signIn,
                          style:
                              TextStyle(color: Theme.of(context).primaryColor, fontSize: 16),
                        ))
                  ],
                ),
                SizedBox(
                  height: context.height * .6,
                  child: Column(
                    children: [
                      CustomTextInput(
                        label: L10n.of(context)!.name,
                        inputFormatters: [
                          FilteringTextInputFormatter.deny(RegExp(r'[0-9]'))
                        ],
                        icon: const Icon(Icons.person_outline),
                        controller: context.read<SignUpViewModel>().nameController,
                        validator: (value) {
                          if (context.read<SignUpViewModel>().nameController.text.isEmpty) {
                            return L10n.of(context)!.nameMessage;
                          }
                          return null;
                        },
                      ),
                      CustomTextInput(
                        label: L10n.of(context)!.surname,
                        inputFormatters: [
                          FilteringTextInputFormatter.deny(RegExp(r'[0-9]'))
                        ],
                        icon: const Icon(Icons.person_outline),
                        controller: context.read<SignUpViewModel>().surnameController,
                        validator: (value) {
                          if (context.read<SignUpViewModel>().surnameController.text.isEmpty) {
                            return L10n.of(context)!.surnameMessage;
                          }
                          return null;
                        },
                      ),
                      CustomTextInput(
                        label: L10n.of(context)!.email,
                        icon: const Icon(Icons.email_outlined),
                        controller: context.read<SignUpViewModel>().emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value!)) {
                            return L10n.of(context)!.validEmailMessage;
                          }
                          return null;
                        },
                      ),
                      CustomPasswordTextField(
                        controller: context.read<SignUpViewModel>().passwordController,
                        validator: (value) {
                          if (!RegExp(r"^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$").hasMatch(value!)) {
                            return L10n.of(context)!.validPasswordMessage;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
      
                      
                      CustomButton(
                        onPressed: () {
                          if(context.read<SignUpViewModel>().formKey.currentState!.validate()){
                            context
                              .read<SignUpViewModel>()
                              .add(SignUpInitialEvent(context));
                          }else{
                            return;
                          }
                        },
                        buttonText: L10n.of(context)!.signUp,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
          )),
      );
    })
    );
  }
}
