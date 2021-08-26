import 'package:astronomy/domain/entities/user_preferences.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

import '../infraestructure/datasources/local_data_source.dart';

const preferencesKey = 'user_preferences';

@Injectable(as: LocalDataSource)
class CLocalDataSource implements LocalDataSource {
  @override
  void setPreferences({required UserPreferences value}) async {
    final userPreferencesBox =
        await Hive.openBox<UserPreferences>(preferencesKey);

    userPreferencesBox.put(preferencesKey, value);
  }

  @override
  Future<UserPreferences> readPreferences() async {
    final userPreferencesBox =
        await Hive.openBox<UserPreferences>(preferencesKey);

    return userPreferencesBox.get(preferencesKey) ??
        UserPreferences(
          useDarkMode: false,
          useHdImages: false,
        );
  }
}
