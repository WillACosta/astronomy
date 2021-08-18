import 'package:flutter/material.dart';

import '../../domain/entities/media.dart';
import '../pages/pages.dart';
import '../utils/utils.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case AppRoutes.initial:
        return MaterialPageRoute(
          builder: (_) => SplashPage(),
        );

      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (_) => HomePage(),
        );

      case AppRoutes.grid:
        return MaterialPageRoute(
          builder: (_) => GridPage(),
        );

      case AppRoutes.settings:
        return MaterialPageRoute(
          builder: (_) => SettingsPage(),
        );

      case AppRoutes.gridDetail:
        if (args is Media) {
          return MaterialPageRoute(
            builder: (_) => GridDetailPage(media: args),
          );
        }

        return _errorRoute();
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
