// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../application/home/home_store.dart' as _i9;
import '../../data/apod_data_source.dart' as _i4;
import '../../domain/repositories/i_apod.repository.dart' as _i5;
import '../../domain/usecases/home/home.usecase.dart' as _i8;
import '../../domain/usecases/home/i_home.usecase.dart' as _i7;
import '../../infraestructure/datasources/i_apod_data_source.dart' as _i3;
import '../../infraestructure/repositories/apod.repository.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.IApodDataSource>(() => _i4.ApodDataSource());
  gh.factory<_i5.IApodRepository>(
      () => _i6.ApodRepository(get<_i3.IApodDataSource>()));
  gh.factory<_i7.IHomeUseCase>(
      () => _i8.HomeUseCase(get<_i5.IApodRepository>()));
  gh.factory<_i9.HomeStore>(() => _i9.HomeStore(get<_i7.IHomeUseCase>()));
  return get;
}
