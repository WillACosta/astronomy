import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

import '../infraestructure/datasources/local_data_source.dart';
import '../domain/adapters/user_preferences.dart';
import '../domain/adapters/showcase.dart';
import '../domain/models/media.dart';
import '../core/types/types.dart';

const preferencesKey = 'user_preferences';
const userFavoritesKey = 'user_favorites';
const displayShowcaseKey = 'display_showcase';

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
  ToggleFavoriteType toggleFavorite({required Media media}) async {
    String dateKey = dateFormatter.format(media.date);

    final favoritesBox = await Hive.openBox<Media>(userFavoritesKey);

    if (favoritesBox.containsKey(dateKey)) {
      favoritesBox.delete(dateKey);
    } else {
      favoritesBox.put(dateKey, media);
    }
  }

  @override
  Future<Showcase> readShowcase() async {
    final box = await Hive.openBox<Showcase>(displayShowcaseKey);
    return box.get(displayShowcaseKey) ??
        Showcase(
          displayHomeShowcase: true,
          displayGridShowcase: true,
          displayGridDetailShowcase: true,
        );
  }

  @override
  Future<void> setShowcase({required Showcase showcase}) async {
    final box = await Hive.openBox<Showcase>(displayShowcaseKey);
    await box.put(displayShowcaseKey, showcase);
  }
}
