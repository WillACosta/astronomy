import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:showcaseview/showcaseview.dart';

import '../../application/container_page/container_page_store.dart';
import '../../external/dependency_injection/locator.dart';
import '../utils/utils.dart';

import 'pages.dart';

class ContainerPage extends StatelessWidget {
  const ContainerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _store = locator<ContainerPageStore>();

    return Scaffold(
      extendBody: true,
      body: PageView(
        controller: _store.pageController,
        onPageChanged: _store.setCurrentPage,
        children: [
          ShowCaseWidget(
            builder: Builder(builder: (_) => const HomePage()),
          ),
          const GridPage(),
          const FavoritesPage(),
          const SettingsPage(),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(getProportionateScreenHeight(15)),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: SafeArea(
          top: false,
          child: Observer(
            builder: (_) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () => _store.toPage(0),
                    icon: const Icon(
                      Icons.home_outlined,
                      size: 25,
                    ),
                    color: _store.currentPage == 0
                        ? Theme.of(context).accentColor
                        : AppColors.accent,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: getProportionateScreenWidth(20),
                      right: getProportionateScreenWidth(20),
                    ),
                    child: IconButton(
                      onPressed: () => _store.toPage(1),
                      icon: const Icon(
                        Icons.grid_view_outlined,
                        size: 25,
                      ),
                      color: _store.currentPage == 1
                          ? Theme.of(context).accentColor
                          : AppColors.accent,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: getProportionateScreenWidth(20),
                    ),
                    child: IconButton(
                      onPressed: () => _store.toPage(2),
                      icon: const Icon(
                        Icons.bookmark_border_outlined,
                        size: 25,
                      ),
                      color: _store.currentPage == 2
                          ? Theme.of(context).accentColor
                          : AppColors.accent,
                    ),
                  ),
                  IconButton(
                    onPressed: () => _store.toPage(3),
                    icon: const Icon(
                      Icons.settings_outlined,
                      size: 25,
                    ),
                    color: _store.currentPage == 3
                        ? Theme.of(context).accentColor
                        : AppColors.accent,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
