import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

import 'package:astronomy/infraestructure/datasources/local_data_source.dart';
import 'package:astronomy/domain/adapters/user_preferences.dart';
import 'package:astronomy/domain/adapters/showcase.dart';
import 'package:astronomy/domain/models/media.dart';
import 'package:astronomy/core/types/types.dart';

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
