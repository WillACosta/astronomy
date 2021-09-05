// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../application/container_page/container_page_store.dart' as _i25;
import '../../application/grid/grid_page_store.dart' as _i22;
import '../../application/home/home_store.dart' as _i23;
import '../../application/settings/settings_store.dart' as _i27;
import '../../application/shared/shared_store.dart' as _i24;
import '../../data/apod_data_source.dart' as _i4;
import '../../data/local_data_source.dart' as _i12;
import '../../domain/repositories/apod_repository.dart' as _i5;
import '../../domain/repositories/settings_repository.dart' as _i15;
import '../../domain/services/download_service.dart' as _i19;
import '../../domain/services/local_notification_service.dart' as _i21;
import '../../domain/services/permissions_service.dart' as _i13;
import '../../domain/usecases/grid/c_grid_usecase.dart' as _i8;
import '../../domain/usecases/grid/grid_usecase.dart' as _i7;
import '../../domain/usecases/home/c_home_usecase.dart' as _i10;
import '../../domain/usecases/home/home_usecase.dart' as _i9;
import '../../domain/usecases/settings/c_settings_usecase.dart' as _i18;
import '../../domain/usecases/settings/settings_usecase.dart' as _i17;
import '../../infraestructure/datasources/apod_data_source.dart' as _i3;
import '../../infraestructure/datasources/local_data_source.dart' as _i11;
import '../../infraestructure/repositories/c_apod_repository.dart' as _i6;
import '../../infraestructure/repositories/c_settings_repository.dart' as _i16;
import '../../infraestructure/services/c_download_service.dart' as _i20;
import '../../infraestructure/services/c_local_notification_service.dart'
    as _i26;
import '../../infraestructure/services/c_permissions_service.dart'
    as _i14; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i19.DownloadService>(() => _i20.CDownloadService(
      get<_i21.LocalNotificationService>(), get<_i13.PermissionsService>()));
  gh.factory<_i22.GridPageStore>(
      () => _i22.GridPageStore(get<_i7.GridUseCase>()));
  gh.factory<_i23.HomeStore>(() => _i23.HomeStore(get<_i9.HomeUseCase>()));
  gh.factory<_i24.SharedStore>(
      () => _i24.SharedStore(get<_i19.DownloadService>()));
  gh.singleton<_i25.ContainerPageStore>(_i25.ContainerPageStore());
  gh.singleton<_i21.LocalNotificationService>(_i26.CLocalNotificationService());
  gh.singleton<_i27.SettingsStore>(
      _i27.SettingsStore(get<_i17.SettingsUseCase>()));
  return get;
}
