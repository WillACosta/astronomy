import 'package:astronomy/application/settings/settings_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../external/dependency_injection/locator.dart';
import 'routes/route_generator.dart';
import 'utils/app_routes.dart';
import '../app_theme.dart';

class App extends StatelessWidget {
  static final appSettingsStore = locator<SettingsStore>();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      print('Mode is ${appSettingsStore.userPreferences.useDarkMode}');

      return MaterialApp(
        title: 'Astronomy',
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.dark,
        initialRoute: AppRoutes.initial,
        onGenerateRoute: RouteGenerator.generateRoute,
      );
    });
  }
}


// appSettingsStore.userPreferences.useDarkMode
//             ? ThemeMode.dark
//             : ThemeMode.light,