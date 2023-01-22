import 'package:hive_flutter/hive_flutter.dart';

import 'user_locale.dart';

part 'user_preferences.g.dart';

@HiveType(typeId: 0)
class UserPreferences extends HiveObject {
  @HiveField(0)
  final bool useDarkMode;

  @HiveField(1)
  final bool useHdImages;

  @HiveField(2)
  final UserLocale? userLocale;

  UserPreferences({
    required this.useDarkMode,
    required this.useHdImages,
    this.userLocale,
  });
}
