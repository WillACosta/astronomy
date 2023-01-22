import '../../adapters/user_preferences.dart';

abstract class SettingsUseCase {
  Future<void> setUserPreferences({required UserPreferences userPreferences});
  Future<UserPreferences> getUserPreferences();
}
