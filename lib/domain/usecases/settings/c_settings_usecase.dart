import 'package:injectable/injectable.dart';

import '../../repositories/settings_repository.dart';
import '../../adapters/user_preferences.dart';

import 'settings_usecase.dart';

@Injectable(as: SettingsUseCase)
class CSettingsUsecase implements SettingsUseCase {
  final SettingsRepository repository;

  CSettingsUsecase(this.repository);

  @override
  Future<UserPreferences> getUserPreferences() async {
    return await repository.getPreferences();
  }

  @override
  Future<void> setUserPreferences({
    required UserPreferences userPreferences,
  }) async {
    return await repository.setPreferences(userPreferences: userPreferences);
  }
}
