import 'dart:io';

import 'package:astronomy/l10n/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../application/localization/localization_store.dart';
import '../../../external/dependency_injection/locator.dart';
import '../../../application/settings/settings_store.dart';
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
  static final localizationStore = locator<LocalizationStore>();

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
              Text(
                AppLocalizations.of(context)!.settings,
                style: AppTextStyles.head(),
              ),
              SizedBox(height: getProportionateScreenHeight(60)),
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
                    currentLocale: store.userPreferences.userLocale,
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
                    currentLocale: store.userPreferences.userLocale,
                  ),
                ),
              ),
              Observer(builder: (_) {
                Locale userLocale = Localizations.localeOf(context);
                final currentLocale = localizationStore.locale ?? userLocale;

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
                        icon: Icon(Icons.arrow_drop_down),
                        items: L10n.all.map(
                          (locale) {
                            final flag = L10n.getFlag(locale.languageCode);

                            return DropdownMenuItem(
                              child: Text(
                                flag,
                                style: TextStyle(fontSize: 32),
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
              })
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
        child: Text('GitHub'),
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
        child: Text('GitHub'),
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
