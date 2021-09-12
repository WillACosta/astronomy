// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../application/container_page/container_page_store.dart' as _i32;
import '../../application/favorites/favorites_store.dart' as _i36;
import '../../application/grid/grid_page_store.dart' as _i29;
import '../../application/home/home_store.dart' as _i30;
import '../../application/localization/localization_store.dart' as _i34;
import '../../application/settings/settings_store.dart' as _i35;
import '../../application/shared/shared_store.dart' as _i31;
import '../../application/translator/translator_store.dart' as _i21;
import '../../data/apod_data_source.dart' as _i4;
import '../../data/local_data_source.dart' as _i12;
import '../../domain/repositories/apod_repository.dart' as _i5;
import '../../domain/repositories/favorites_repository.dart' as _i25;
import '../../domain/repositories/settings_repository.dart' as _i15;
import '../../domain/services/download_service.dart' as _i22;
import '../../domain/services/local_notification_service.dart' as _i24;
import '../../domain/services/permissions_service.dart' as _i13;
import '../../domain/services/translator_service.dart' as _i19;
import '../../domain/usecases/favorites/c_favorites_usecase.dart' as _i28;
import '../../domain/usecases/favorites/favorites_usecase.dart' as _i27;
import '../../domain/usecases/grid/c_grid_usecase.dart' as _i8;
import '../../domain/usecases/grid/grid_usecase.dart' as _i7;
import '../../domain/usecases/home/c_home_usecase.dart' as _i10;
import '../../domain/usecases/home/home_usecase.dart' as _i9;
import '../../domain/usecases/settings/c_settings_usecase.dart' as _i18;
import '../../domain/usecases/settings/settings_usecase.dart' as _i17;
import '../../infraestructure/datasources/apod_data_source.dart' as _i3;
import '../../infraestructure/datasources/local_data_source.dart' as _i11;
import '../../infraestructure/repositories/c_apod_repository.dart' as _i6;
import '../../infraestructure/repositories/c_favorites_repository.dart' as _i26;
import '../../infraestructure/repositories/c_settings_repository.dart' as _i16;
import '../../infraestructure/services/c_download_service.dart' as _i23;
import '../../infraestructure/services/c_local_notification_service.dart'
    as _i33;
import '../../infraestructure/services/c_permissions_service.dart' as _i14;
import '../../infraestructure/services/c_translator_service.dart'
    as _i20; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.ApodDataSource>(() => _i4.CApodDataSource());
  gh.factory<_i5.ApodRepository>(
      () => _i6.CApodRepository(get<_i3.ApodDataSource>()));
  gh.factory<_i7.GridUseCase>(
      () => _i8.CGridUseCase(get<_i5.ApodRepository>()));
  gh.factory<_i9.HomeUseCase>(
      () => _i10.CHomeUseCase(get<_i5.ApodRepository>()));
  gh.factory<_i11.LocalDataSource>(() => _i12.CLocalDataSource());
  gh.factory<_i13.PermissionsService>(() => _i14.CPermissionsService());
  gh.factory<_i15.SettingsRepository>(
      () => _i16.CSettingsRepository(get<_i11.LocalDataSource>()));
  gh.factory<_i17.SettingsUseCase>(
      () => _i18.CSettingsUsecase(get<_i15.SettingsRepository>()));
  gh.factory<_i19.TranslatorService>(() => _i20.CTranslatorService());
  gh.factory<_i21.TranslatorStore>(
      () => _i21.TranslatorStore(get<_i19.TranslatorService>()));
  gh.factory<_i22.DownloadService>(() => _i23.CDownloadService(
      get<_i24.LocalNotificationService>(), get<_i13.PermissionsService>()));
  gh.factory<_i25.FavoritesRepository>(
      () => _i26.CFavoritesRepository(get<_i11.LocalDataSource>()));
  gh.factory<_i27.FavoritesUseCase>(
      () => _i28.CFavoritesUsecase(get<_i25.FavoritesRepository>()));
  gh.factory<_i29.GridPageStore>(
      () => _i29.GridPageStore(get<_i7.GridUseCase>()));
  gh.factory<_i30.HomeStore>(() => _i30.HomeStore(get<_i9.HomeUseCase>()));
  gh.factory<_i31.SharedStore>(
      () => _i31.SharedStore(get<_i22.DownloadService>()));
  gh.singleton<_i32.ContainerPageStore>(_i32.ContainerPageStore());
  gh.singleton<_i24.LocalNotificationService>(_i33.CLocalNotificationService());
  gh.singleton<_i34.LocalizationStore>(_i34.LocalizationStore());
  gh.singleton<_i35.SettingsStore>(
      _i35.SettingsStore(get<_i17.SettingsUseCase>()));
  gh.singleton<_i36.FavoriteStore>(
      _i36.FavoriteStore(get<_i27.FavoritesUseCase>()));
  return get;
}
