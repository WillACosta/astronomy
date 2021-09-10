import '../../../core/types/types.dart';
import '../entities/media.dart';

abstract class FavoritesRepository {
  AddFavoriteType addFavorite({required Media media});
}
