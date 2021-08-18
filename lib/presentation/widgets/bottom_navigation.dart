import 'package:flutter/material.dart';

import '../routes/route_navigator.dart';
import '../utils/utils.dart' show AppColors, AppRoutes, MenuState;

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    Key? key,
    required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () => navigateTo(context, routeName: AppRoutes.home),
              icon: Icon(Icons.home_outlined),
              color: MenuState.home == selectedMenu
                  ? AppColors.secondary
                  : AppColors.accent,
            ),
            IconButton(
              onPressed: () => navigateTo(context, routeName: AppRoutes.grid),
              icon: Icon(Icons.grid_view_outlined),
              color: MenuState.grid == selectedMenu
                  ? AppColors.secondary
                  : AppColors.accent,
            ),
            IconButton(
              onPressed: () => navigateTo(context, routeName: AppRoutes.settings),
              icon: Icon(Icons.settings_outlined),
              color: MenuState.settings == selectedMenu
                  ? AppColors.secondary
                  : AppColors.accent,
            ),
          ],
        ),
      ),
    );
  }
}
