import '../../domain/adapters/user_preferences.dart';
import '../../domain/adapters/showcase.dart';
import '../../domain/entities/media.dart';
import '../../core/types/types.dart';

abstract class LocalDataSource {
  Future<UserPreferences> readPreferences();
  Future<void> setPreferences({required UserPreferences value});

  Future<void> setShowcase({required Showcase showcase});
  Future<Showcase> readShowcase();

  ToggleFavoriteType toggleFavorite({required Media media});
}
