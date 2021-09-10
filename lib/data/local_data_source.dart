import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

import '../infraestructure/datasources/local_data_source.dart';
import '../domain/adapters/user_preferences.dart';
import '../domain/entities/media.dart';
import '../core/types/types.dart';

const preferencesKey = 'user_preferences';
const userFavoritesKey = 'user_favorites';

@Injectable(as: LocalDataSource)
class CLocalDataSource implements LocalDataSource {
  DateFormat dateFormatter = DateFormat();

  @override
  Future<void> setPreferences({required UserPreferences value}) async {
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
          userLocale: null,
        );
  }

  @override
  AddFavoriteType addFavorite({required Media media}) async {
    String dateKey = dateFormatter.format(media.date);

    final favoritesBox = await Hive.openBox<Media>(userFavoritesKey);
    return favoritesBox.put(dateKey, media);
  }
}
