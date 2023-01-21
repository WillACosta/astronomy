import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
// import 'package:astronomy/l10n/l10n.dart';

import 'package:astronomy/application/localization/localization_store.dart';
import 'package:astronomy/external/dependency_injection/locator.dart';
import 'package:astronomy/application/settings/settings_store.dart';
import 'package:astronomy/application/shared/shared_store.dart';
import 'package:astronomy/presentation/routes/route_navigator.dart';
import 'package:astronomy/presentation/widgets/widgets.dart';
import 'package:astronomy/presentation/utils/utils.dart';

import 'package:astronomy/presentation/pages/settings/components/alert_dialog_widget.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  static final store = serviceLocator<SettingsStore>();
  static final sharedStore = serviceLocator<SharedStore>();
  static final localizationStore = serviceLocator<LocalizationStore>();

  @override
  Widget build(BuildContext context) {
    AppSizeConfig().init(context);

    Locale systemLocale = Localizations.localeOf(context);

    return PlatformScaffold(
      title: AppBarTitle(title: AppLocalizations.of(context)!.settings),
      body: SafeArea(
        child: AppPagesPadding(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SettingsListTile(
                label: AppLocalizations.of(context)!.aboutThisProject,
                onTap: () => showAboutDialog(context),
                semanticsLabel: 'About this project button',
              ),
              SizedBox(height: getProportionateScreenHeight(10)),
              Observer(
                builder: (_) => PlatformSwitchListButton(
                  label: AppLocalizations.of(context)!.useHdImages,
                  value: store.userPreferences.useHdImages,
                  semanticsLabel: 'Use hd images switch button',
                  onChanged: (value) => store.setPreferences(
                    useDarkMode: store.userPreferences.useDarkMode,
                    useHdImages: value,
                    currentLocale:
                        store.userPreferences.userLocale ?? systemLocale,
                  ),
                ),
              ),
              Observer(
                builder: (_) => PlatformSwitchListButton(
                  label: AppLocalizations.of(context)!.darkmode,
                  value: store.userPreferences.useDarkMode,
                  semanticsLabel: 'Dark mode switch button',
                  onChanged: (value) => store.setPreferences(
                    useDarkMode: value,
                    useHdImages: store.userPreferences.useHdImages,
                    currentLocale:
                        store.userPreferences.userLocale ?? systemLocale,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  showAboutDialog(BuildContext context) {
    String title = AppLocalizations.of(context)!.aboutThisProject;
    String content = AppLocalizations.of(context)!.aboutContent;
    String closeText = AppLocalizations.of(context)!.close;
    String repositoryUrl = 'https://github.com/WillACosta/astronomy';

    var cupertinoActions = [
      CupertinoDialogAction(
        isDefaultAction: true,
        child: const Text('GitHub'),
        onPressed: () => sharedStore.launchUrl(repositoryUrl),
      ),
      CupertinoDialogAction(
        isDestructiveAction: true,
        child: Text(closeText),
        onPressed: () => closeRoute(context),
      )
    ];

    var materialActions = [
      MaterialButton(
        child: const Text(
          'GitHub',
          semanticsLabel: 'Open GitHub page button',
        ),
        onPressed: () => sharedStore.launchUrl(repositoryUrl),
      ),
      MaterialButton(
        child: Text(closeText, semanticsLabel: 'Close modal button'),
        onPressed: () => closeRoute(context),
      )
    ];

    if (Platform.isIOS) {
      showCupertinoDialog(
        context: context,
        builder: (_) {
          return AnimatedBounce(
            child: AlertDialogWidget(
              title: title,
              content: content,
              actions: cupertinoActions,
            ),
          );
        },
      );
    }

    if (Platform.isAndroid) {
      showDialog(
        context: context,
        builder: (_) {
          return AnimatedBounce(
            child: AlertDialogWidget(
              title: title,
              content: content,
              actions: materialActions,
            ),
          );
        },
      );
    }
  }
}
