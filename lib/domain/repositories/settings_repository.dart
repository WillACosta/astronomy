import 'package:astronomy/domain/adapters/user_preferences.dart';

abstract class SettingsRepository {
  Future<UserPreferences> getPreferences();
  Future<void> setPreferences({required UserPreferences userPreferences});
}
