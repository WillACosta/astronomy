import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';

import '../../../application/settings/settings_store.dart';
import '../../../external/dependency_injection/locator.dart';
import '../../../application/shared/shared_store.dart';
import '../../routes/route_navigator.dart';
import '../../widgets/widgets.dart';

import 'components/alert_dialog_widget.dart';

import '../../utils/utils.dart'
    show
        AppSizeConfig,
        getProportionateScreenHeight,
        getProportionateScreenWidth,
        AppTextStyles;

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  static final store = locator<SettingsStore>();
  static final sharedStore = locator<SharedStore>();

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
                onTap: () => showAboutDialog(context),
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

  showAboutDialog(BuildContext context) {
    String title = 'About this project';
    String content =
        "This project was developed with Flutter and use NASA's APOD API to display awesome pictures and videos of the universe each day.\n\nFor more information please visit the repository on GitHub.";

    var cupertinoActions = [
      CupertinoDialogAction(
        isDefaultAction: true,
        child: Text('GitHub'),
        onPressed: () => sharedStore.launchUrl(
          'https://github.com/WillACosta/astronomy',
        ),
      ),
      CupertinoDialogAction(
        isDestructiveAction: true,
        child: Text("Close"),
        onPressed: () => closeRoute(context),
      )
    ];

    var materialActions = [
      MaterialButton(
        child: Text('GitHub'),
        onPressed: () => sharedStore.launchUrl(
          'https://github.com/WillACosta/astronomy',
        ),
      ),
      MaterialButton(
        child: Text("Close"),
        onPressed: () => closeRoute(context),
      )
    ];

    if (Platform.isIOS) {
      showCupertinoDialog(
        context: context,
        builder: (_) {
          return AlertDialogWidget(
            title: title,
            content: content,
            actions: cupertinoActions,
          );
        },
      );
    }

    if (Platform.isAndroid) {
      showDialog(
        context: context,
        builder: (_) {
          return AlertDialogWidget(
            title: title,
            content: content,
            actions: materialActions,
          );
        },
      );
    }
  }
}
