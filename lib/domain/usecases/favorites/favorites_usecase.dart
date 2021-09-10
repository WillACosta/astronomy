import '../../../core/types/types.dart';
import '../../entities/media.dart';

abstract class FavoritesUseCase {
  AddFavoriteType addFavorite({required Media media});
  RemoveFavoriteType removeFavorite();
}
