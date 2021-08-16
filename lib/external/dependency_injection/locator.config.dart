// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../application/grid/grid_page_store.dart' as _i11;
import '../../application/home/home_store.dart' as _i12;
import '../../data/apod_data_source.dart' as _i4;
import '../../domain/repositories/apod_repository.dart' as _i5;
import '../../domain/usecases/grid/c_grid_usecase.dart' as _i8;
import '../../domain/usecases/grid/grid_usecase.dart' as _i7;
import '../../domain/usecases/home/c_home_usecase.dart' as _i10;
import '../../domain/usecases/home/home_usecase.dart' as _i9;
import '../../infraestructure/datasources/apod_data_source.dart' as _i3;
import '../../infraestructure/repositories/c_apod_repository.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i11.GridPageStore>(
      () => _i11.GridPageStore(get<_i7.GridUseCase>()));
  gh.factory<_i12.HomeStore>(() => _i12.HomeStore(get<_i9.HomeUseCase>()));
  return get;
}
