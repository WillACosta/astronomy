// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:astronomy/application/container_page/container_page_store.dart'
    as _i7;
import 'package:astronomy/application/favorites/favorites_store.dart' as _i40;
import 'package:astronomy/application/grid/grid_page_store.dart' as _i32;
import 'package:astronomy/application/home/home_store.dart' as _i33;
import 'package:astronomy/application/localization/localization_store.dart'
    as _i14;
import 'package:astronomy/application/settings/settings_store.dart' as _i36;
import 'package:astronomy/application/shared/shared_store.dart' as _i41;
import 'package:astronomy/application/showcase/showcase_store.dart' as _i37;
import 'package:astronomy/application/translator/translator_store.dart' as _i27;
import 'package:astronomy/data/apod_data_source.dart' as _i4;
import 'package:astronomy/data/local_data_source.dart' as _i13;
import 'package:astronomy/domain/repositories/apod_repository.dart' as _i5;
import 'package:astronomy/domain/repositories/favorites_repository.dart'
    as _i28;
import 'package:astronomy/domain/repositories/settings_repository.dart' as _i17;
import 'package:astronomy/domain/repositories/showcase_repository.dart' as _i21;
import 'package:astronomy/domain/services/download_service.dart' as _i38;
import 'package:astronomy/domain/services/local_notification_service.dart'
    as _i34;
import 'package:astronomy/domain/services/permissions_service.dart' as _i15;
import 'package:astronomy/domain/services/translator_service.dart' as _i25;
import 'package:astronomy/domain/usecases/favorites/c_favorites_usecase.dart'
    as _i31;
import 'package:astronomy/domain/usecases/favorites/favorites_usecase.dart'
    as _i30;
import 'package:astronomy/domain/usecases/grid/c_grid_usecase.dart' as _i9;
import 'package:astronomy/domain/usecases/grid/grid_usecase.dart' as _i8;
import 'package:astronomy/domain/usecases/home/c_home_usecase.dart' as _i11;
import 'package:astronomy/domain/usecases/home/home_usecase.dart' as _i10;
import 'package:astronomy/domain/usecases/settings/c_settings_usecase.dart'
    as _i20;
import 'package:astronomy/domain/usecases/settings/settings_usecase.dart'
    as _i19;
import 'package:astronomy/domain/usecases/showcase/c_showcase_usecase.dart'
    as _i24;
import 'package:astronomy/domain/usecases/showcase/showcase_usecase.dart'
    as _i23;
import 'package:astronomy/infraestructure/datasources/apod_data_source.dart'
    as _i3;
import 'package:astronomy/infraestructure/datasources/local_data_source.dart'
    as _i12;
import 'package:astronomy/infraestructure/repositories/c_apod_repository.dart'
    as _i6;
import 'package:astronomy/infraestructure/repositories/c_favorites_repository.dart'
    as _i29;
import 'package:astronomy/infraestructure/repositories/c_settings_repository.dart'
    as _i18;
import 'package:astronomy/infraestructure/repositories/c_showcase_repository.dart'
    as _i22;
import 'package:astronomy/infraestructure/services/c_download_service.dart'
    as _i39;
import 'package:astronomy/infraestructure/services/c_local_notification_service.dart'
    as _i35;
import 'package:astronomy/infraestructure/services/c_permissions_service.dart'
    as _i16;
import 'package:astronomy/infraestructure/services/c_translator_service.dart'
    as _i26;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of main-scope dependencies inside of [GetIt]
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.ApodDataSource>(() => _i4.CApodDataSource());
    gh.factory<_i5.ApodRepository>(
        () => _i6.CApodRepository(gh<_i3.ApodDataSource>()));
    gh.singleton<_i7.ContainerPageStore>(_i7.ContainerPageStore());
    gh.factory<_i8.GridUseCase>(
        () => _i9.CGridUseCase(gh<_i5.ApodRepository>()));
    gh.factory<_i10.HomeUseCase>(
        () => _i11.CHomeUseCase(gh<_i5.ApodRepository>()));
    gh.factory<_i12.LocalDataSource>(() => _i13.CLocalDataSource());
    gh.singleton<_i14.LocalizationStore>(_i14.LocalizationStore());
    gh.factory<_i15.PermissionsService>(() => _i16.CPermissionsService());
    gh.factory<_i17.SettingsRepository>(
        () => _i18.CSettingsRepository(gh<_i12.LocalDataSource>()));
    gh.factory<_i19.SettingsUseCase>(
        () => _i20.CSettingsUsecase(gh<_i17.SettingsRepository>()));
    gh.factory<_i21.ShowcaseRepository>(
        () => _i22.CShowcaseRepository(gh<_i12.LocalDataSource>()));
    gh.factory<_i23.ShowcaseUseCase>(
        () => _i24.CShowcaseUsecase(gh<_i21.ShowcaseRepository>()));
    gh.factory<_i25.TranslatorService>(() => _i26.CTranslatorService());
    gh.factory<_i27.TranslatorStore>(
        () => _i27.TranslatorStore(gh<_i25.TranslatorService>()));
    gh.factory<_i28.FavoritesRepository>(
        () => _i29.CFavoritesRepository(gh<_i12.LocalDataSource>()));
    gh.factory<_i30.FavoritesUseCase>(
        () => _i31.CFavoritesUsecase(gh<_i28.FavoritesRepository>()));
    gh.lazySingleton<_i32.GridPageStore>(
        () => _i32.GridPageStore(gh<_i8.GridUseCase>()));
    gh.lazySingleton<_i33.HomeStore>(
        () => _i33.HomeStore(gh<_i10.HomeUseCase>()));
    gh.factory<_i34.LocalNotificationService>(
        () => _i35.CLocalNotificationService(gh<_i14.LocalizationStore>()));
    gh.singleton<_i36.SettingsStore>(
        _i36.SettingsStore(gh<_i19.SettingsUseCase>()));
    gh.singleton<_i37.ShowCaseStore>(
        _i37.ShowCaseStore(gh<_i23.ShowcaseUseCase>()));
    gh.factory<_i38.DownloadService>(() => _i39.CDownloadService(
          gh<_i34.LocalNotificationService>(),
          gh<_i15.PermissionsService>(),
        ));
    gh.singleton<_i40.FavoriteStore>(
        _i40.FavoriteStore(gh<_i30.FavoritesUseCase>()));
    gh.factory<_i41.SharedStore>(
        () => _i41.SharedStore(gh<_i38.DownloadService>()));
    return this;
  }
}
