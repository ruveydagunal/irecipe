import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:irecipe/app/l10n/app_localizations.dart';
import 'package:irecipe/app/router/app_router.dart';
import 'package:irecipe/app/views/view_home/view_model/home_event.dart';
import 'package:irecipe/app/views/view_home/view_model/home_state.dart';
import 'package:irecipe/app/views/view_home/view_model/home_view_model.dart';
import 'package:irecipe/core/constanst/color_constants.dart';
import 'package:irecipe/core/extensions/context_extension.dart';
import 'package:irecipe/core/repository/service/auth_service.dart';

import 'package:uuid/uuid.dart';

@RoutePage()
class HomeView extends StatelessWidget {
  HomeView({super.key});
  AuthService authService = AuthService();

  Uuid uuid = const Uuid();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => HomeViewModel()..add(HomeInitialEvent()),
        child: BlocConsumer<HomeViewModel, HomeState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  L10n.of(context)!.iRecipe,
                ),
              ),
              body: ListView.builder(
                shrinkWrap: true,
                itemCount: state.recipes!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: context.horizontalPaddingConstNormal +
                        context.onlyTopPaddingMedium,
                    child: GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            isDismissible: false,
                              useSafeArea: true,
                              isScrollControlled: true,
                              context: context,
                              builder: (context) {
                                return SingleChildScrollView(
                                  child: Padding(
                                    padding: context.paddingNormal,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: context.width * 0.8,
                                              child: Text(
                                                state.recipes![index]['foodName'],
                                                style:
                                                    ( const TextStyle(fontSize: 35)),
                                                    overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            IconButton(onPressed: (){
                                              context.router.pop();
                                            }, icon: Icon(Icons.clear))
                                          ],
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      state.recipes![index]
                                                          ['image']),
                                                  fit: BoxFit.cover),
                                              color:
                                                  ColorConstants.primaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          height: 250,
                                        ),
                                        const Text(
                                          'Malzemeler',
                                          style: (TextStyle(fontSize: 30)),
                                        ),
                                        ListView.builder(
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          itemCount: state
                                              .recipes![index]['materials']
                                              .length,
                                          itemBuilder: (
                                            context,
                                            index2,
                                          ) {
                                            return Text(
                                                state.recipes![index]
                                                    ['materials'][index2],
                                                style: (const TextStyle(
                                                    fontSize: 16)));
                                          },
                                        ),
                                        const Text(
                                          'Hazırlanışı',
                                          style: (TextStyle(fontSize: 30)),
                                        ),
                                        Text(
                                          state.recipes![index]['recipe'],
                                          style: const TextStyle(fontSize: 16),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              });
                        },
                        child: state.recipes![index]['image'] != null ? Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      state.recipes![index]['image']),
                                  fit: BoxFit.cover),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                            ),
                            height: 250,
                            child: Stack(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  // crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(10)), color: Colors.orange[100] ),
                                      height: 40,
                                      child: Padding(
                                        padding: context.horizontalPaddingLow,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: context.width * 0.7,
                                              child: Text(
                                                state.recipes![index]['foodName'],
                                                style: context
                                                    .textTheme.headlineSmall!,
                                                    overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            IconButton(
                                                onPressed: () {},
                                                icon: Icon(
                                                  Icons.favorite_outline,
                                                ))
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )) : Center(child: CircularProgressIndicator()) ) ,
                  );
                },
              ),
            );
          },
        ));
  }
}
