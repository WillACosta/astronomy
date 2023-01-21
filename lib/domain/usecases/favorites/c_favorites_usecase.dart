import 'package:injectable/injectable.dart';

import 'package:astronomy/domain/repositories/favorites_repository.dart';
import 'package:astronomy/core/types/types.dart';
import 'package:astronomy/domain/models/media.dart';

import 'package:astronomy/domain/usecases/favorites/favorites_usecase.dart';

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
