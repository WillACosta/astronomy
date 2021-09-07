import 'dart:io';

import 'package:flutter/material.dart';
import 'package:astronomy/domain/entities/user_locale.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import 'domain/entities/user_preferences.dart';
import 'external/init_configurations.dart';
import 'presentation/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Directory dir = await getApplicationDocumentsDirectory();
  Hive.registerAdapter(UserPreferencesAdapter());
  Hive.registerAdapter(UserLocaleAdapter());

  await Hive.initFlutter(dir.path);

  initConfigurations();
  runApp(App());
}
