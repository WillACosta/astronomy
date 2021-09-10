import '../../domain/adapters/user_preferences.dart';
import '../../domain/entities/media.dart';
import '../../core/types/types.dart';

abstract class LocalDataSource {
  Future<UserPreferences> readPreferences();
  Future<void> setPreferences({required UserPreferences value});
  AddFavoriteType addFavorite({required Media media});
}
