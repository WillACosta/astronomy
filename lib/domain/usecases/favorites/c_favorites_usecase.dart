import 'package:injectable/injectable.dart';

import '../../repositories/favorites_repository.dart';
import '../../../core/types/types.dart';
import '../../entities/media.dart';

import 'favorites_usecase.dart';

@Injectable(as: FavoritesUseCase)
class CFavoritesUsecase implements FavoritesUseCase {
  final FavoritesRepository _repository;

  CFavoritesUsecase(this._repository);

  @override
  ToggleFavoriteType toggleFavorite({required Media media}) async {
    await _repository.toggleFavorite(media: media);
  }

  @override
  RemoveFavoriteType removeFavorite() {
    throw UnimplementedError();
  }
}
