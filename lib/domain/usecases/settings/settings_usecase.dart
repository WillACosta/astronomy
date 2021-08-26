import '../../entities/user_preferences.dart';

abstract class SettingsUseCase {
  void setUserPreferences({ required UserPreferences userPreferences });
  Future<UserPreferences> getUserPreferences();
}
