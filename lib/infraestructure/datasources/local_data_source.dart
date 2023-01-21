import 'package:astronomy/domain/adapters/user_preferences.dart';
import 'package:astronomy/domain/adapters/showcase.dart';
import 'package:astronomy/domain/models/media.dart';
import 'package:astronomy/core/types/types.dart';

abstract class LocalDataSource {
  Future<UserPreferences> readPreferences();
  Future<void> setPreferences({required UserPreferences value});

  Future<void> setShowcase({required Showcase showcase});
  Future<Showcase> readShowcase();

  ToggleFavoriteType toggleFavorite({required Media media});
}
