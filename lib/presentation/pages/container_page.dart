import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

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
          HomePage(),
          GridPage(),
          SettingsPage(),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(top: getProportionateScreenHeight(15)),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.only(
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
                    icon: Icon(Icons.home_outlined),
                    color: _store.currentPage == 0
                        ? Theme.of(context).accentColor
                        : AppColors.accent,
                  ),
                  IconButton(
                    onPressed: () => _store.toPage(1),
                    icon: Icon(Icons.grid_view_outlined),
                    color: _store.currentPage == 1
                        ? Theme.of(context).accentColor
                        : AppColors.accent,
                  ),
                  IconButton(
                    onPressed: () => _store.toPage(2),
                    icon: Icon(Icons.settings_outlined),
                    color: _store.currentPage == 2
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
