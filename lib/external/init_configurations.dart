import 'package:astronomy/external/dependency_injection/locator.dart';
import 'package:astronomy/external/env/load_env.dart';

void initConfigurations() async {
  configureInjection();
  await loadEnv();
}
