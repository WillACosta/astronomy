
import 'package:hive_flutter/hive_flutter.dart';

part 'user_preferences.g.dart';

@HiveType(typeId: 0)
class UserPreferences extends HiveObject {

  @HiveField(0)
  final bool useDarkMode;

  @HiveField(1)
  final bool useHdImages;

  UserPreferences({required this.useDarkMode, required this.useHdImages});
}