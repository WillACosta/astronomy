import 'dart:io';

import 'package:flutter/material.dart';

import 'package:path_provider/path_provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'domain/adapters/user_preferences.dart';
import 'external/init_configurations.dart';
import 'domain/adapters/user_locale.dart';
import 'domain/adapters/showcase.dart';
import 'domain/entities/media.dart';
import 'presentation/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Directory dir = await getApplicationDocumentsDirectory();
  Hive.registerAdapter(UserPreferencesAdapter());
  Hive.registerAdapter(UserLocaleAdapter());
  Hive.registerAdapter(MediaAdapter());
  Hive.registerAdapter(ShowcaseAdapter());

  await Hive.initFlutter(dir.path);

  initConfigurations();
  HttpOverrides.global = AppHttpOverrides();

  runApp(const App());
}

class AppHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) {
        final isValidHost = host == 'api.nasa.gov' || host == 'apod.nasa.gov';
        return isValidHost;
      };
  }
}
