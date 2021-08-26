import '../entities/user_preferences.dart';

abstract class SettingsRepository {
  Future<UserPreferences> getPreferences();
  void setPreferences({required UserPreferences userPreferences});
}
