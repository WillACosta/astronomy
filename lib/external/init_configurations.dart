import 'dependency_injection/locator.dart';
import 'env/load_env.dart';

void initConfigurations() async {
  configureInjection();
  await loadEnv();
}
