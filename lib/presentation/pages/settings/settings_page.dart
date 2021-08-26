import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';

import '../../../application/settings/settings_store.dart';
import '../../../external/dependency_injection/locator.dart';

import '../../utils/utils.dart'
    show
        AppSizeConfig,
        getProportionateScreenHeight,
        getProportionateScreenWidth,
        AppTextStyles;

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  static final store = locator<SettingsStore>();

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
              Observer(builder: (_) {
                return SwitchListTile(
                  value: store.userPreferences.useHdImages,
                  onChanged: (value) {
                    store.setPreferences(
                      isLightTheme: store.userPreferences.useDarkMode,
                      useHdImages: value,
                    );
                  },
                  title: Text(
                    'Use HD images',
                    style: AppTextStyles.body,
                  ),
                );
              }),
              Observer(builder: (_) {
                return SwitchListTile(
                  value: store.userPreferences.useDarkMode,
                  onChanged: (value) {
                    store.setPreferences(
                      isLightTheme: value,
                      useHdImages: store.userPreferences.useHdImages,
                    );
                  },
                  title: Text(
                    'Dark mode',
                    style: AppTextStyles.body,
                  ),
                );
              }),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: BottomNavigation(selectedMenu: MenuState.settings),
    );
  }
}
