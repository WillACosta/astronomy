import 'package:flutter/material.dart';

import 'utils/app_routes.dart';
import 'routes/route_generator.dart';

import '../app_theme.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Astronomy',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      initialRoute: AppRoutes.container,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
