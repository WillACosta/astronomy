import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'locator.config.dart';

final GetIt serviceLocator = GetIt.instance;

@injectableInit
Future<void> configureInjection() async => serviceLocator.init();
