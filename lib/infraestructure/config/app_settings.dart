import 'package:hive_flutter/hive_flutter.dart';

class AppSettings {
  late Box box;

  AppSettings() {
    _init();
  }

  void _init() async {
    await _initPreferences();
  }

  Future<void> _initPreferences() async {
    box = await Hive.openBox('preferences');
  }
}