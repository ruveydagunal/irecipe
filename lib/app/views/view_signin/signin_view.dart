import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:irecipe/app/router/app_router.dart';
import 'package:irecipe/app/views/view_signin/view_model/signin_event.dart';
import 'package:irecipe/app/views/view_signin/view_model/signin_state.dart';
import 'package:irecipe/app/views/view_signin/view_model/signin_view_model.dart';
import 'package:irecipe/core/extensions/context_extension.dart';
import 'package:irecipe/core/widgets/custom_button.dart';
import 'package:irecipe/core/widgets/custom_input.dart';

@RoutePage()
class SignInView extends StatelessWidget {
  SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => SignInViewModel(),
    child: BlocBuilder<SignInViewModel, SignInState>(builder: (context,state){
      return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: context.paddingNormal,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Giriş Yapın',
                  style: TextStyle(color: Colors.orange[800], fontSize: 40, fontWeight: FontWeight.w500)),
              Row(
                      children: [
                        Text('Hesabınız Yok mu?',
                            style: TextStyle(fontSize: 16)),
                        TextButton(
                            onPressed: () =>context.router.push(SignUpViewRoute()),
                            child: Text(
                              'Kayıt Ol',
                              style:  TextStyle(
                                      color: Colors.orange[800], fontSize: 16),
                            ))
                      ],
                    ),
              SizedBox(
                height: context.height * .6,
                child: Column(
                
                  children: [
                    CustomTextInput(
                      label: 'Email',
                      icon: Icon(Icons.email_outlined),
                      controller: context.read<SignInViewModel>().emailController,
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
                      icon: Icon(Icons.key_outlined),
                      textInputAction: TextInputAction.done,
                      controller: context.read<SignInViewModel>().passwordController,
                       validator: (value) {
                            if (context.read<SignInViewModel>().passwordController.text.isEmpty) {
                              return "Lütfen İsim Soyisim Giriniz";
                            }
                            return null;
                          }
                      
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                      onPressed: () {
                        context
                            .read<SignInViewModel>()
                            .add(SignInInitialEvent(context));
                      },
                      buttonText: 'Giriş Yap',
                    ),
                    
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
    }),
    );
  }
}
