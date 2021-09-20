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

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  static final settingsStore = locator<SettingsStore>();
  static final localizationStore = locator<LocalizationStore>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
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
          locale: settingsStore.userPreferences.userLocale,
        );
      },
    );
  }
}
