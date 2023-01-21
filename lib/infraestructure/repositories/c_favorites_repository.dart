import 'package:astronomy/core/types/types.dart';
import 'package:injectable/injectable.dart';

import 'package:astronomy/domain/repositories/favorites_repository.dart';
import 'package:astronomy/infraestructure/datasources/local_data_source.dart';
import 'package:astronomy/domain/entities/media.dart';

@Injectable(as: FavoritesRepository)
class CFavoritesRepository implements FavoritesRepository {
  final LocalDataSource _dataSource;

  CFavoritesRepository(this._dataSource);

  @override
  ToggleFavoriteType toggleFavorite({required Media media}) async {
    await _dataSource.toggleFavorite(media: media);
  }
}
