import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:irecipe/app/router/app_router.dart';
import 'package:irecipe/core/extensions/context_extension.dart';
import 'package:irecipe/core/widgets/custom_button.dart';
import 'package:irecipe/core/widgets/custom_input.dart';

@RoutePage()
class SignUpView extends StatelessWidget {
  SignUpView({super.key});
  TextEditingController personController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dayController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: context.paddingNormal,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Kayıt Olun',
                  style: TextStyle(color: Colors.orange[800], fontSize: 40, fontWeight: FontWeight.w500)),
              Row(
                      children: [
                        Text('Hesabınız Var mı?',
                            style: TextStyle(fontSize: 16)),
                        TextButton(
                            onPressed: () =>context.router.push(SignInViewRoute()),
                            child: Text(
                              'Giriş Yap',
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
                      label: 'İsim Soyisim',
                      
                      inputFormatters: [FilteringTextInputFormatter.deny(RegExp(r'[0-9]'))],
                      icon: Icon(Icons.person_outline),
                      controller: personController,
                       validator: (value) {
                            if (personController.text.isEmpty) {
                              return "Lütfen İsim Soyisim Giriniz";
                            }
                            return null;
                          },
                    ),
                    CustomTextInput(
                      label: 'Email',
                      icon: Icon(Icons.email_outlined),
                      controller: emailController,
                       keyboardType: TextInputType.emailAddress,
                       validator: (value) {
                          if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value!)) { 
                             return "Lütfen Geçerli Bir Mail Adresi Giriniz";
                          }
                          return null;
                        },
                    ),
                    CustomTextInput(
                      label: 'Doğum Günü',
                      keyboardType: TextInputType.number,
                      icon: Icon(Icons.calendar_month_outlined),
                      controller: dayController,
                       validator: (value) {
                            if (!RegExp(r'([0-2]?[1-9]|[1-3][01])[,/.-](0?[1-9]|1[0-2])[,/.-]\d{4}$').hasMatch(value!)) {
                              return "Lütfen Geçerli Bir Doğum Günü Giriniz";
                            }
                            return null;
                          }
                    ),
                    CustomTextInput(
                      label: 'Şifre',
                      textInputAction: TextInputAction.done,
                      icon: Icon(Icons.key_outlined),
                      controller: passwordController,
                       validator: (value) {
                            if (passwordController.text.isEmpty) {
                              return "Lütfen İsim Soyisim Giriniz";
                            }
                            return null;
                          }
                      
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                      onPressed: () {},
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
  }
}
