import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> loadEnv() async {
  const isProduction = bool.fromEnvironment('dart.vm.product');
  await dotenv.load(fileName: isProduction ? '.env' : '.env');
}
