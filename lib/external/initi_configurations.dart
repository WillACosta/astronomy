import 'package:astronomy/infraestructure/config/hive_config.dart';

import 'dependency_injection/locator.dart';
import 'env/load_env.dart';

void initConfigurations() async {
  configureInjection();
  await loadEnv();
  await HiveConfig.init();
}