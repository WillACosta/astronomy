// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:astronomy/application/container_page/container_page_store.dart'
    as _i8;
import 'package:astronomy/application/favorites/favorites_store.dart' as _i43;
import 'package:astronomy/application/grid/grid_page_store.dart' as _i35;
import 'package:astronomy/application/home/home_store.dart' as _i36;
import 'package:astronomy/application/localization/localization_store.dart'
    as _i15;
import 'package:astronomy/application/settings/settings_store.dart' as _i39;
import 'package:astronomy/application/shared/shared_store.dart' as _i44;
import 'package:astronomy/application/showcase/showcase_store.dart' as _i40;
import 'package:astronomy/application/translator/translator_store.dart' as _i30;
import 'package:astronomy/data/apod_data_source.dart' as _i5;
import 'package:astronomy/data/local_data_source.dart' as _i14;
import 'package:astronomy/data/services/nasa_open_apis_service.dart' as _i16;
import 'package:astronomy/domain/repositories/apod_repository.dart' as _i6;
import 'package:astronomy/domain/repositories/favorites_repository.dart'
    as _i31;
import 'package:astronomy/domain/repositories/settings_repository.dart' as _i20;
import 'package:astronomy/domain/repositories/showcase_repository.dart' as _i24;
import 'package:astronomy/domain/services/download_service.dart' as _i41;
import 'package:astronomy/domain/services/local_notification_service.dart'
    as _i37;
import 'package:astronomy/domain/services/permissions_service.dart' as _i18;
import 'package:astronomy/domain/services/translator_service.dart' as _i28;
import 'package:astronomy/domain/usecases/favorites/c_favorites_usecase.dart'
    as _i34;
import 'package:astronomy/domain/usecases/favorites/favorites_usecase.dart'
    as _i33;
import 'package:astronomy/domain/usecases/grid/c_grid_usecase.dart' as _i10;
import 'package:astronomy/domain/usecases/grid/grid_usecase.dart' as _i9;
import 'package:astronomy/domain/usecases/home/c_home_usecase.dart' as _i12;
import 'package:astronomy/domain/usecases/home/home_usecase.dart' as _i11;
import 'package:astronomy/domain/usecases/settings/c_settings_usecase.dart'
    as _i23;
import 'package:astronomy/domain/usecases/settings/settings_usecase.dart'
    as _i22;
import 'package:astronomy/domain/usecases/showcase/c_showcase_usecase.dart'
    as _i27;
import 'package:astronomy/domain/usecases/showcase/showcase_usecase.dart'
    as _i26;
import 'package:astronomy/external/external.dart' as _i17;
import 'package:astronomy/external/http/client/api_client.dart' as _i3;
import 'package:astronomy/infraestructure/datasources/apod_data_source.dart'
    as _i4;
import 'package:astronomy/infraestructure/datasources/local_data_source.dart'
    as _i13;
import 'package:astronomy/infraestructure/repositories/c_apod_repository.dart'
    as _i7;
import 'package:astronomy/infraestructure/repositories/c_favorites_repository.dart'
    as _i32;
import 'package:astronomy/infraestructure/repositories/c_settings_repository.dart'
    as _i21;
import 'package:astronomy/infraestructure/repositories/c_showcase_repository.dart'
    as _i25;
import 'package:astronomy/infraestructure/services/c_download_service.dart'
    as _i42;
import 'package:astronomy/infraestructure/services/c_local_notification_service.dart'
    as _i38;
import 'package:astronomy/infraestructure/services/c_permissions_service.dart'
    as _i19;
import 'package:astronomy/infraestructure/services/c_translator_service.dart'
    as _i29;
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
    gh.lazySingleton<_i3.ApiClient>(() => _i3.ApiClient());
    gh.factory<_i4.ApodDataSource>(() => _i5.CApodDataSource());
    gh.factory<_i6.ApodRepository>(
        () => _i7.CApodRepository(gh<_i4.ApodDataSource>()));
    gh.singleton<_i8.ContainerPageStore>(_i8.ContainerPageStore());
    gh.factory<_i9.GridUseCase>(
        () => _i10.CGridUseCase(gh<_i6.ApodRepository>()));
    gh.factory<_i11.HomeUseCase>(
        () => _i12.CHomeUseCase(gh<_i6.ApodRepository>()));
    gh.factory<_i13.LocalDataSource>(() => _i14.CLocalDataSource());
    gh.singleton<_i15.LocalizationStore>(_i15.LocalizationStore());
    gh.factory<_i16.NASAOpenAPIsService>(
        () => _i16.NASAOpenAPIsService.create(gh<_i17.ApiClient>()));
    gh.factory<_i18.PermissionsService>(() => _i19.CPermissionsService());
    gh.factory<_i20.SettingsRepository>(
        () => _i21.CSettingsRepository(gh<_i13.LocalDataSource>()));
    gh.factory<_i22.SettingsUseCase>(
        () => _i23.CSettingsUsecase(gh<_i20.SettingsRepository>()));
    gh.factory<_i24.ShowcaseRepository>(
        () => _i25.CShowcaseRepository(gh<_i13.LocalDataSource>()));
    gh.factory<_i26.ShowcaseUseCase>(
        () => _i27.CShowcaseUsecase(gh<_i24.ShowcaseRepository>()));
    gh.factory<_i28.TranslatorService>(() => _i29.CTranslatorService());
    gh.factory<_i30.TranslatorStore>(
        () => _i30.TranslatorStore(gh<_i28.TranslatorService>()));
    gh.factory<_i31.FavoritesRepository>(
        () => _i32.CFavoritesRepository(gh<_i13.LocalDataSource>()));
    gh.factory<_i33.FavoritesUseCase>(
        () => _i34.CFavoritesUsecase(gh<_i31.FavoritesRepository>()));
    gh.lazySingleton<_i35.GridPageStore>(
        () => _i35.GridPageStore(gh<_i9.GridUseCase>()));
    gh.lazySingleton<_i36.HomeStore>(
        () => _i36.HomeStore(gh<_i11.HomeUseCase>()));
    gh.factory<_i37.LocalNotificationService>(
        () => _i38.CLocalNotificationService(gh<_i15.LocalizationStore>()));
    gh.singleton<_i39.SettingsStore>(
        _i39.SettingsStore(gh<_i22.SettingsUseCase>()));
    gh.singleton<_i40.ShowCaseStore>(
        _i40.ShowCaseStore(gh<_i26.ShowcaseUseCase>()));
    gh.factory<_i41.DownloadService>(() => _i42.CDownloadService(
          gh<_i37.LocalNotificationService>(),
          gh<_i18.PermissionsService>(),
        ));
    gh.singleton<_i43.FavoriteStore>(
        _i43.FavoriteStore(gh<_i33.FavoritesUseCase>()));
    gh.factory<_i44.SharedStore>(
        () => _i44.SharedStore(gh<_i41.DownloadService>()));
    return this;
  }
}
