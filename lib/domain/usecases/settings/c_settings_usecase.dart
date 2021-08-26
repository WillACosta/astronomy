import 'package:injectable/injectable.dart';

import 'package:astronomy/domain/entities/user_preferences.dart';
import 'package:astronomy/domain/repositories/settings_repository.dart';
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
  void setUserPreferences({required UserPreferences userPreferences}) {
    return repository.setPreferences(userPreferences: userPreferences);
  }
}
