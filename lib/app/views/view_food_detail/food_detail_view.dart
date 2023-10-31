import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:irecipe/app/l10n/app_localizations.dart';
import 'package:irecipe/core/constanst/color_constants.dart';
import 'package:irecipe/core/extensions/context_extension.dart';

@RoutePage()
class DetailView extends StatelessWidget {
  DetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(L10n.of(context)!.email,),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: context.paddingNormal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: ColorConstants.primaryColor,
                    borderRadius: BorderRadius.circular(10)),
                height: 250,
              ),
              Text(
                'Food Name',
                style: (TextStyle(fontSize: 40)),
              ),
              Text(
                'Malzemeler',
                style: (TextStyle(fontSize: 30)),
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return  Text('deneme', style: (TextStyle(fontSize: 16)));
                },
              ),
              Text(
                'Hazırlanışı',
                style: (TextStyle(fontSize: 30)),
              ),
              Text('Tarif detayları deneme denemedenemedenemedenemedenemedenemedenemedenemedenemedenemedenemedenemedenemedenemedenemedenemedenemedenemedenemedenemedenemedenemedenemedenemedeneme denemedenemedenemedenemedenemedenemedenemedeneme denemedenemedeneme denemedenemedeneme ' ,style: TextStyle(fontSize: 16),)
            ],
          ),
        ),
      ),
    );
  }
}
