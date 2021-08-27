import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../external/dependency_injection/locator.dart';
import '../application/settings/settings_store.dart';
import '../app_theme.dart';

import 'routes/route_generator.dart';
import 'utils/app_routes.dart';

class App extends StatelessWidget {
  static final store = locator<SettingsStore>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return MaterialApp(
          title: 'Astronomy',
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: store.userPreferences.useDarkMode
              ? ThemeMode.dark
              : ThemeMode.light,
          initialRoute: AppRoutes.initial,
          onGenerateRoute: RouteGenerator.generateRoute,
        );
      },
    );
  }
}
