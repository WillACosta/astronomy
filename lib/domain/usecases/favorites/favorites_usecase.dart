import '../../../core/types/types.dart';
import '../../entities/media.dart';

abstract class FavoritesUseCase {
  ToggleFavoriteType toggleFavorite({required Media media});
  RemoveFavoriteType removeFavorite();
}
