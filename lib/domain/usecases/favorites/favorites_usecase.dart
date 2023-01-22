import '../../../core/types/types.dart';
import '../../models/media.dart';

abstract class FavoritesUseCase {
  ToggleFavoriteType toggleFavorite({required Media media});
  RemoveFavoriteType removeFavorite();
}
