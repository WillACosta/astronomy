import 'package:astronomy/core/types/types.dart';
import 'package:astronomy/domain/entities/media.dart';

abstract class FavoritesRepository {
  ToggleFavoriteType toggleFavorite({required Media media});
}
