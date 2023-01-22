import 'package:flutter/material.dart';

import '../../domain/models/media.dart';
import '../widgets/widgets.dart';
import '../pages/pages.dart';
import '../utils/utils.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case AppRoutes.initial:
        return MaterialPageRoute(
          builder: (_) => const SplashPage(),
        );

      case AppRoutes.container:
        return MaterialPageRoute(
          builder: (_) => const ContainerPage(),
        );

      case AppRoutes.gridDetail:
        if (args is Media) {
          return MaterialPageRoute(
            builder: (_) => GridDetailPage(media: args),
          );
        }
        return _errorRoute();

      case AppRoutes.imageView:
        if (args is Media) {
          return MaterialPageRoute(
            builder: (_) => ImageView(media: args),
          );
        }

        return _errorRoute();
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) => const ErrorStateWidget());
  }
}
