import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:showcaseview/showcaseview.dart';

import '../../application/container_page/container_page_store.dart';
import '../../external/dependency_injection/locator.dart';
import '../../application/showcase/showcase_store.dart';
import '../utils/utils.dart';

import 'pages.dart';

class ContainerPage extends StatelessWidget {
  const ContainerPage({Key? key}) : super(key: key);

  static final _showcaseStore = locator<ShowCaseStore>();

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
            onComplete: (__, _) => _showcaseStore.closeShowCase(
              showcasePage: ShowcasePage.home,
            ),
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
                    icon: Icon(
                      Platform.isAndroid
                          ? Icons.home_outlined
                          : CupertinoIcons.home,
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
                      icon: Icon(
                        Platform.isAndroid
                            ? Icons.grid_view_outlined
                            : CupertinoIcons.rectangle_grid_2x2,
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
                      icon: Icon(
                        Platform.isAndroid
                            ? Icons.bookmark_border_outlined
                            : CupertinoIcons.bookmark,
                        size: 25,
                      ),
                      color: _store.currentPage == 2
                          ? Theme.of(context).accentColor
                          : AppColors.accent,
                    ),
                  ),
                  IconButton(
                    onPressed: () => _store.toPage(3),
                    icon: Icon(
                      Platform.isAndroid
                          ? Icons.settings_outlined
                          : CupertinoIcons.settings,
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
