import 'package:injectable/injectable.dart';

import 'package:astronomy/domain/repositories/settings_repository.dart';
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
  Future<void> setUserPreferences(
      {required UserPreferences userPreferences}) async {
    return await repository.setPreferences(userPreferences: userPreferences);
  }
}
