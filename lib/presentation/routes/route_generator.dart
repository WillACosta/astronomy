import 'package:flutter/material.dart';

import 'package:astronomy/domain/models/media.dart';
import 'package:astronomy/presentation/widgets/widgets.dart';
import 'package:astronomy/presentation/pages/pages.dart';
import 'package:astronomy/presentation/utils/utils.dart';

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
