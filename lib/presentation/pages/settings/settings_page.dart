import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:astronomy/l10n/l10n.dart';

import '../../../application/localization/localization_store.dart';
import '../../../external/dependency_injection/locator.dart';
import '../../../application/settings/settings_store.dart';
import '../../../application/shared/shared_store.dart';
import '../../routes/route_navigator.dart';
import '../../widgets/widgets.dart';

import 'components/alert_dialog_widget.dart';

import '../../utils/utils.dart'
    show AppSizeConfig, getProportionateScreenHeight, AppTextStyles;

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  static final store = locator<SettingsStore>();
  static final sharedStore = locator<SharedStore>();
  static final localizationStore = locator<LocalizationStore>();

  @override
  Widget build(BuildContext context) {
    AppSizeConfig().init(context);

    Locale systemLocale = Localizations.localeOf(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).primaryColor,
        title: AppBarTitle(title: AppLocalizations.of(context)!.settings),
      ),
      body: SafeArea(
        child: AppPagesPadding(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SettingsListTile(
                label: AppLocalizations.of(context)!.aboutThisProject,
                onTap: () => showAboutDialog(context),
              ),
              SizedBox(height: getProportionateScreenHeight(10)),
              Observer(
                builder: (_) => SwitchListButton(
                  label: AppLocalizations.of(context)!.useHdImages,
                  value: store.userPreferences.useHdImages,
                  onChanged: (value) => store.setPreferences(
                    useDarkMode: store.userPreferences.useDarkMode,
                    useHdImages: value,
                    currentLocale:
                        store.userPreferences.userLocale ?? systemLocale,
                  ),
                ),
              ),
              Observer(
                builder: (_) => SwitchListButton(
                  label: AppLocalizations.of(context)!.darkmode,
                  value: store.userPreferences.useDarkMode,
                  onChanged: (value) => store.setPreferences(
                    useDarkMode: value,
                    useHdImages: store.userPreferences.useHdImages,
                    currentLocale:
                        store.userPreferences.userLocale ?? systemLocale,
                  ),
                ),
              ),
              Observer(
                builder: (_) {
                  final currentLocale =
                      localizationStore.locale ?? systemLocale;

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.selectYourLanguage,
                        style: AppTextStyles.body(),
                      ),
                      DropdownButtonHideUnderline(
                        child: DropdownButton(
                          value: currentLocale,
                          icon: const Icon(Icons.arrow_drop_down),
                          items: L10n.all.map(
                            (locale) {
                              final flag = L10n.getFlag(locale.languageCode);

                              return DropdownMenuItem(
                                child: Text(
                                  flag,
                                  style: const TextStyle(fontSize: 25),
                                ),
                                value: locale,
                                onTap: () {
                                  localizationStore.setLocale(locale);
                                  store.setPreferences(
                                    useDarkMode:
                                        store.userPreferences.useDarkMode,
                                    useHdImages:
                                        store.userPreferences.useHdImages,
                                    currentLocale: locale,
                                  );
                                },
                              );
                            },
                          ).toList(),
                          onChanged: (_) {},
                        ),
                      ),
                    ],
                  );
                },
              )
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
        child: const Text('GitHub'),
        onPressed: () => sharedStore.launchUrl(repositoryUrl),
      ),
      MaterialButton(
        child: Text(closeText),
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
