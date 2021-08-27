// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../application/container_page/container_page_store.dart' as _i7;
import '../../application/grid/grid_page_store.dart' as _i18;
import '../../application/home/home_store.dart' as _i19;
import '../../application/settings/settings_store.dart' as _i20;
import '../../data/apod_data_source.dart' as _i4;
import '../../data/local_data_source.dart' as _i13;
import '../../domain/repositories/apod_repository.dart' as _i5;
import '../../domain/repositories/settings_repository.dart' as _i14;
import '../../domain/usecases/grid/c_grid_usecase.dart' as _i9;
import '../../domain/usecases/grid/grid_usecase.dart' as _i8;
import '../../domain/usecases/home/c_home_usecase.dart' as _i11;
import '../../domain/usecases/home/home_usecase.dart' as _i10;
import '../../domain/usecases/settings/c_settings_usecase.dart' as _i17;
import '../../domain/usecases/settings/settings_usecase.dart' as _i16;
import '../../infraestructure/datasources/apod_data_source.dart' as _i3;
import '../../infraestructure/datasources/local_data_source.dart' as _i12;
import '../../infraestructure/repositories/c_apod_repository.dart' as _i6;
import '../../infraestructure/repositories/c_settings_repository.dart'
    as _i15; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.ApodDataSource>(() => _i4.CApodDataSource());
  gh.factory<_i5.ApodRepository>(
      () => _i6.CApodRepository(get<_i3.ApodDataSource>()));
  gh.factory<_i7.ContainerPageStore>(() => _i7.ContainerPageStore());
  gh.factory<_i8.GridUseCase>(
      () => _i9.CGridUseCase(get<_i5.ApodRepository>()));
  gh.factory<_i10.HomeUseCase>(
      () => _i11.CHomeUseCase(get<_i5.ApodRepository>()));
  gh.factory<_i12.LocalDataSource>(() => _i13.CLocalDataSource());
  gh.factory<_i14.SettingsRepository>(
      () => _i15.CSettingsRepository(get<_i12.LocalDataSource>()));
  gh.factory<_i16.SettingsUseCase>(
      () => _i17.CSettingsUsecase(get<_i14.SettingsRepository>()));
  gh.factory<_i18.GridPageStore>(
      () => _i18.GridPageStore(get<_i8.GridUseCase>()));
  gh.factory<_i19.HomeStore>(() => _i19.HomeStore(get<_i10.HomeUseCase>()));
  gh.singleton<_i20.SettingsStore>(
      _i20.SettingsStore(get<_i16.SettingsUseCase>()));
  return get;
}
