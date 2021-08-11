import '../utils/utils.dart' show AppRoutes;
import '../pages/pages.dart';

var routes = {
  AppRoutes.initial: (_) => const SplashPage(),
  AppRoutes.home: (_) => HomePage(),
  AppRoutes.grid: (_) => GridPage(),
  AppRoutes.settings: (_) => SettingsPage(),
};
