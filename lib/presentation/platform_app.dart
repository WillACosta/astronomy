import 'package:astronomy/presentation/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../application/localization/localization_store.dart';
import '../external/dependency_injection/locator.dart';
import '../application/settings/settings_store.dart';
import '../app_theme.dart';

import 'routes/route_generator.dart';
import 'utils/app_routes.dart';
import 'widgets/molecules/platform_widget.dart';

class PlatformApp extends PlatformWidget<Observer, Observer> {
  const PlatformApp({Key? key}) : super(key: key);

  static final settingsStore = serviceLocator<SettingsStore>();
  static final localizationStore = serviceLocator<LocalizationStore>();

  @override
  Observer createAndroidWidget(BuildContext context) {
    return Observer(builder: (_) {
      return MaterialApp(
        title: 'Astronomy',
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: settingsStore.userPreferences.useDarkMode
            ? ThemeMode.dark
            : ThemeMode.light,
        initialRoute: AppRoutes.initial,
        onGenerateRoute: RouteGenerator.generateRoute,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        // locale: settingsStore.userPreferences.userLocale,
        locale: const Locale('en'),
      );
    });
  }

  @override
  Observer createIosWidget(BuildContext context) {
    return Observer(builder: (_) {
      return CupertinoApp(
        title: 'Astronomy',
        debugShowCheckedModeBanner: false,
        theme: CupertinoThemeData(
            brightness: settingsStore.userPreferences.useDarkMode
                ? Brightness.dark
                : Brightness.light,
            barBackgroundColor: AppColors.primary),
        initialRoute: AppRoutes.initial,
        onGenerateRoute: RouteGenerator.generateRoute,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        // locale: settingsStore.userPreferences.userLocale,
        locale: const Locale('en'),
      );
    });
  }
}
