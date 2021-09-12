import '../../../core/types/types.dart';
import '../entities/media.dart';

abstract class FavoritesRepository {
  ToggleFavoriteType toggleFavorite({required Media media});
}
