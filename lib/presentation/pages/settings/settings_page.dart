import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';

import '../../../application/settings/settings_store.dart';
import '../../../external/dependency_injection/locator.dart';
import '../../widgets/widgets.dart';

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
              Text('Settings', style: AppTextStyles.head()),
              SizedBox(height: getProportionateScreenHeight(60)),
              SettingsListTile(
                label: 'About this project',
                onTap: () {},
              ),
              SizedBox(height: getProportionateScreenHeight(10)),
              Observer(builder: (_) {
                return SwitchListButton(
                  label: 'Use HD images',
                  value: store.userPreferences.useHdImages,
                  onChanged: (value) => store.setPreferences(
                    useDarkMode: store.userPreferences.useDarkMode,
                    useHdImages: value,
                  ),
                );
              }),
              Observer(builder: (_) {
                return SwitchListButton(
                  label: 'Dark Mode',
                  value: store.userPreferences.useDarkMode,
                  onChanged: (value) => store.setPreferences(
                    useDarkMode: value,
                    useHdImages: store.userPreferences.useHdImages,
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
