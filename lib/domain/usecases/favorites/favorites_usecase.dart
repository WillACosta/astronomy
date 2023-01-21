import 'package:astronomy/core/types/types.dart';
import 'package:astronomy/domain/models/media.dart';

abstract class FavoritesUseCase {
  ToggleFavoriteType toggleFavorite({required Media media});
  RemoveFavoriteType removeFavorite();
}
