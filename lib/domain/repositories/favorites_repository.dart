import '../../core/types/types.dart';
import '../models/media.dart';

abstract class FavoritesRepository {
  ToggleFavoriteType toggleFavorite({required Media media});
}
