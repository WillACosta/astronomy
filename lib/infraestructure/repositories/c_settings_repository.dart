import 'package:injectable/injectable.dart';

import '../../domain/repositories/settings_repository.dart';
import '../../domain/adapters/user_preferences.dart';
import '../datasources/local_data_source.dart';


@Injectable(as: SettingsRepository)
class CSettingsRepository implements SettingsRepository {
  final LocalDataSource _dataSource;

  CSettingsRepository(this._dataSource);

  @override
  Future<UserPreferences> getPreferences() async {
    return await _dataSource.readPreferences();
  }

  @override
  Future<void> setPreferences({required UserPreferences userPreferences}) async {
    await _dataSource.setPreferences(value: userPreferences);
  }
}
