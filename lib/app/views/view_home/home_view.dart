import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:irecipe/app/l10n/app_localizations.dart';
import 'package:irecipe/app/views/view_home/view_model/home_event.dart';
import 'package:irecipe/app/views/view_home/view_model/home_state.dart';
import 'package:irecipe/app/views/view_home/view_model/home_view_model.dart';
import 'package:irecipe/app/views/view_home/widgets/home_widgets.dart';
import 'package:irecipe/core/constanst/color_constants.dart';
import 'package:irecipe/core/extensions/context_extension.dart';
import 'package:irecipe/core/repository/service/auth_service.dart';

import 'package:uuid/uuid.dart';

@RoutePage()
class HomeView extends StatelessWidget with HomeWidgets {
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
            actions: [
              IconButton(onPressed: (){
                context.read<HomeViewModel>().add(HomeInitialEvent());
              }, icon: Icon(Icons.refresh))
            ],
            ),
            body: ListView.builder(
              shrinkWrap: true,
              itemCount: state.recipe!.length,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: context.width * 0.8,
                                        child: Text(
                                          state.recipe![index]['foodName'],
                                          style: const TextStyle(fontSize: 35),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          context.router.pop();
                                        },
                                        icon: Icon(Icons.clear),
                                      )
                                    ],
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          state.recipe![index]['image'],
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                      color: ColorConstants.primaryColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    height: 250,
                                  ),
                                   Text(
                                    L10n.of(context)!.materials,
                                    style: TextStyle(fontSize: 30),
                                  ),
                                  ListView.builder(
                                    physics: const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: state.recipe![index]['materials'].length,
                                    itemBuilder: (context, index2) {
                                      return Text(
                                        state.recipe![index]['materials'][index2],
                                        style: const TextStyle(fontSize: 16),
                                      );
                                    },
                                  ),
                                   Text(
                                    L10n.of(context)!.preparation,
                                    style: TextStyle(fontSize: 30),
                                  ),
                                  Text(
                                    state.recipe![index]['recipe'],
                                    style: const TextStyle(fontSize: 16),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: state.recipe![index]['image'] != null
                        ? Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(state.recipe![index]['image']),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                            ),
                            height: 250,
                            child: ValueListenableBuilder(
                              valueListenable: Hive.box('favorites').listenable(),
                              
                              builder: (context, box, child) {
                                return infoStack(context, state, index);
                                
                              },
                            ),
                          )
                        : Center(child: CircularProgressIndicator()),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
