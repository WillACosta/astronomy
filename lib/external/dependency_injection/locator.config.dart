// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../application/container_page/container_page_store.dart' as _i36;
import '../../application/favorites/favorites_store.dart' as _i41;
import '../../application/grid/grid_page_store.dart' as _i33;
import '../../application/home/home_store.dart' as _i34;
import '../../application/localization/localization_store.dart' as _i38;
import '../../application/settings/settings_store.dart' as _i39;
import '../../application/shared/shared_store.dart' as _i35;
import '../../application/showcase/showcase_store.dart' as _i40;
import '../../application/translator/translator_store.dart' as _i25;
import '../../data/apod_data_source.dart' as _i4;
import '../../data/local_data_source.dart' as _i12;
import '../../domain/repositories/apod_repository.dart' as _i5;
import '../../domain/repositories/favorites_repository.dart' as _i29;
import '../../domain/repositories/settings_repository.dart' as _i15;
import '../../domain/repositories/showcase_repository.dart' as _i19;
import '../../domain/services/download_service.dart' as _i26;
import '../../domain/services/local_notification_service.dart' as _i28;
import '../../domain/services/permissions_service.dart' as _i13;
import '../../domain/services/translator_service.dart' as _i23;
import '../../domain/usecases/favorites/c_favorites_usecase.dart' as _i32;
import '../../domain/usecases/favorites/favorites_usecase.dart' as _i31;
import '../../domain/usecases/grid/c_grid_usecase.dart' as _i8;
import '../../domain/usecases/grid/grid_usecase.dart' as _i7;
import '../../domain/usecases/home/c_home_usecase.dart' as _i10;
import '../../domain/usecases/home/home_usecase.dart' as _i9;
import '../../domain/usecases/settings/c_settings_usecase.dart' as _i18;
import '../../domain/usecases/settings/settings_usecase.dart' as _i17;
import '../../domain/usecases/showcase/c_showcase_usecase.dart' as _i22;
import '../../domain/usecases/showcase/showcase_usecase.dart' as _i21;
import '../../infraestructure/datasources/apod_data_source.dart' as _i3;
import '../../infraestructure/datasources/local_data_source.dart' as _i11;
import '../../infraestructure/repositories/c_apod_repository.dart' as _i6;
import '../../infraestructure/repositories/c_favorites_repository.dart' as _i30;
import '../../infraestructure/repositories/c_settings_repository.dart' as _i16;
import '../../infraestructure/repositories/c_showcase_repository.dart' as _i20;
import '../../infraestructure/services/c_download_service.dart' as _i27;
import '../../infraestructure/services/c_local_notification_service.dart'
    as _i37;
import '../../infraestructure/services/c_permissions_service.dart' as _i14;
import '../../infraestructure/services/c_translator_service.dart'
    as _i24; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i19.ShowcaseRepository>(
      () => _i20.CShowcaseRepository(get<_i11.LocalDataSource>()));
  gh.factory<_i21.ShowcaseUseCase>(
      () => _i22.CShowcaseUsecase(get<_i19.ShowcaseRepository>()));
  gh.factory<_i23.TranslatorService>(() => _i24.CTranslatorService());
  gh.factory<_i25.TranslatorStore>(
      () => _i25.TranslatorStore(get<_i23.TranslatorService>()));
  gh.factory<_i26.DownloadService>(() => _i27.CDownloadService(
      get<_i28.LocalNotificationService>(), get<_i13.PermissionsService>()));
  gh.factory<_i29.FavoritesRepository>(
      () => _i30.CFavoritesRepository(get<_i11.LocalDataSource>()));
  gh.factory<_i31.FavoritesUseCase>(
      () => _i32.CFavoritesUsecase(get<_i29.FavoritesRepository>()));
  gh.lazySingleton<_i33.GridPageStore>(
      () => _i33.GridPageStore(get<_i7.GridUseCase>()));
  gh.lazySingleton<_i34.HomeStore>(
      () => _i34.HomeStore(get<_i9.HomeUseCase>()));
  gh.factory<_i35.SharedStore>(
      () => _i35.SharedStore(get<_i26.DownloadService>()));
  gh.singleton<_i36.ContainerPageStore>(_i36.ContainerPageStore());
  gh.singleton<_i28.LocalNotificationService>(_i37.CLocalNotificationService());
  gh.singleton<_i38.LocalizationStore>(_i38.LocalizationStore());
  gh.singleton<_i39.SettingsStore>(
      _i39.SettingsStore(get<_i17.SettingsUseCase>()));
  gh.singleton<_i40.ShowCaseStore>(
      _i40.ShowCaseStore(get<_i21.ShowcaseUseCase>()));
  gh.singleton<_i41.FavoriteStore>(
      _i41.FavoriteStore(get<_i31.FavoritesUseCase>()));
  return get;
}
