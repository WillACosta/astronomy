import 'package:flutter/material.dart';

import 'external/dependency_injection/locator.dart';
import 'presentation/app.dart';

void main() {
  configureInjection();
  runApp(App());
}
