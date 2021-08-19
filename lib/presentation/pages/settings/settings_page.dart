import 'package:flutter/material.dart';

import '../../widgets/widgets.dart' show BottomNavigation;

import '../../utils/utils.dart'
    show
        AppSizeConfig,
        MenuState,
        getProportionateScreenHeight,
        getProportionateScreenWidth,
        AppTextStyles;

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppSizeConfig().init(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: getProportionateScreenHeight(30),
            horizontal: getProportionateScreenWidth(25),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Settings', style: AppTextStyles.head),
              SizedBox(height: getProportionateScreenHeight(60)),
              TextButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('About this project'),
                    Icon(Icons.chevron_right_outlined),
                  ],
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(10)),
              TextButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Darkmode'),
                    Switch(
                      activeColor: Colors.white,
                      value: true,
                      onChanged: (value) {},
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Use HD images'),
                    Switch(
                      activeColor: Colors.white,
                      value: true,
                      onChanged: (value) {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: BottomNavigation(selectedMenu: MenuState.settings),
    );
  }
}
