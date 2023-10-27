import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:irecipe/app/router/app_router.dart';
import 'package:irecipe/app/views/view_signup/view_model/signup_event.dart';
import 'package:irecipe/app/views/view_signup/view_model/signup_state.dart';
import 'package:irecipe/app/views/view_signup/view_model/signup_view_model.dart';
import 'package:irecipe/core/extensions/context_extension.dart';
import 'package:irecipe/core/widgets/custom_button.dart';
import 'package:irecipe/core/widgets/custom_input.dart';

@RoutePage()
class SignUpView extends StatelessWidget {
  SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => SignUpViewModel(),
    child: BlocBuilder<SignUpViewModel, SignUpState>(builder: (context, state) {
      return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: context.paddingNormal,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Kayıt Olun',
                  style: TextStyle(
                      color: Colors.orange[800],
                      fontSize: 40,
                      fontWeight: FontWeight.w500)),
              Row(
                children: [
                  const Text('Hesabınız Var mı?', style: TextStyle(fontSize: 16)),
                  TextButton(
                      onPressed: () => context.router.push(SignInViewRoute()),
                      child: Text(
                        'Giriş Yap',
                        style:
                            TextStyle(color: Colors.orange[800], fontSize: 16),
                      ))
                ],
              ),
              SizedBox(
                height: context.height * .6,
                child: Column(
                  children: [
                    CustomTextInput(
                      label: 'İsim',
                      inputFormatters: [
                        FilteringTextInputFormatter.deny(RegExp(r'[0-9]'))
                      ],
                      icon: const Icon(Icons.person_outline),
                      controller: context.read<SignUpViewModel>().nameController,
                      validator: (value) {
                        if (context.read<SignUpViewModel>().nameController.text.isEmpty) {
                          return "Lütfen İsim Giriniz";
                        }
                        return null;
                      },
                    ),
                    CustomTextInput(
                      label: 'Soyisim',
                      inputFormatters: [
                        FilteringTextInputFormatter.deny(RegExp(r'[0-9]'))
                      ],
                      icon: const Icon(Icons.person_outline),
                      controller: context.read<SignUpViewModel>().surnameController,
                      validator: (value) {
                        if (context.read<SignUpViewModel>().surnameController.text.isEmpty) {
                          return "Lütfen Soyisim Giriniz";
                        }
                        return null;
                      },
                    ),
                    CustomTextInput(
                      label: 'Email',
                      icon: const Icon(Icons.email_outlined),
                      controller: context.read<SignUpViewModel>().emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value!)) {
                          return "Lütfen Geçerli Bir Mail Adresi Giriniz";
                        }
                        return null;
                      },
                    ),
                    CustomTextInput(
                        label: 'Şifre',
                        textInputAction: TextInputAction.done,
                        icon: const Icon(Icons.key_outlined),
                        controller: context.read<SignUpViewModel>().passwordController,
                        validator: (value) {
                          if (context.read<SignUpViewModel>().passwordController.text.isEmpty) {
                            return "Lütfen İsim Soyisim Giriniz";
                          }
                          return null;
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                      onPressed: () {
                        context
                            .read<SignUpViewModel>()
                            .add(SignUpInitialEvent(context));
                      },
                      buttonText: 'Kayıt Ol',
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
    })
    );
  }
}
