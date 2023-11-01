import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:irecipe/app/l10n/app_localizations.dart';
import 'package:irecipe/app/router/app_router.dart';
import 'package:irecipe/core/constanst/color_constants.dart';
import 'package:irecipe/core/extensions/context_extension.dart';

@RoutePage()
class BottomNavigationWidget extends StatefulWidget {
  const BottomNavigationWidget({super.key});

  @override
  State<BottomNavigationWidget> createState() => _ButtomNavigationWidgetState();
}

class _ButtomNavigationWidgetState extends State<BottomNavigationWidget> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        lazyLoad: false,
        resizeToAvoidBottomInset: false,
        routes: [HomeViewRoute(), CategoriesViewRoute(), AddingRecipeViewRoute(), FavoriteViewRoute(), ProfileViewRoute()],
        bottomNavigationBuilder: (context, tabsRouter) {
          return Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  // margin: context.onlyBottomPaddingMedium,
                  alignment: Alignment.topCenter,
                  height: context.height * 0.08,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: BottomNavigationBar(
                        selectedItemColor: ColorConstants.primaryColor,
                        showUnselectedLabels: true,
                        type: BottomNavigationBarType.fixed,
                        elevation: 0,
                        currentIndex: tabsRouter.activeIndex,
                        onTap: tabsRouter.setActiveIndex,
                        items: [
                           BottomNavigationBarItem(
                              label: L10n.of(context)!.home,
                              activeIcon: Icon(Icons.home),
                              icon: Icon(Icons.home_outlined)),
                              BottomNavigationBarItem(
                              label: L10n.of(context)!.categories,
                              activeIcon: Icon(Icons.category),
                              icon: Icon(Icons.category_outlined)),
                              BottomNavigationBarItem(
                              label: L10n.of(context)!.add,
                              activeIcon: Icon(Icons.add_circle),
                              icon: Icon(Icons.add_circle_outline)),
                           BottomNavigationBarItem(
                              label: L10n.of(context)!.favorites,
                              activeIcon: Icon(Icons.favorite),
                              icon: Icon(Icons.favorite_border)),
                           BottomNavigationBarItem(
                              label: L10n.of(context)!.profile,
                              activeIcon: Icon(Icons.person),
                              icon: Icon(Icons.person_outline))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }
}
