import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import '../../domain/usecases/favorites/favorites_usecase.dart';
import '../../domain/entities/media.dart';

part 'favorites_store.g.dart';

@singleton
class FavoriteStore = _FavoriteStoreBase with _$FavoriteStore;

abstract class _FavoriteStoreBase with Store {
  final FavoritesUseCase _usecase;
  late Box favoritesBox;

  _FavoriteStoreBase(this._usecase) {
    _init();
  }

  void _init() async {
    await _initPreferences();
  }

  Future<void> _initPreferences() async {
    favoritesBox = await Hive.openBox<Media>('user_favorites');
  }

  Future<void> toggleFavorite({required Media item}) async {
    await _usecase.toggleFavorite(media: item);
  }
}
