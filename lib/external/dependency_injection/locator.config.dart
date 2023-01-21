// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:astronomy/application/container_page/container_page_store.dart'
    as _i4;
import 'package:astronomy/application/favorites/favorites_store.dart' as _i39;
import 'package:astronomy/application/grid/grid_page_store.dart' as _i40;
import 'package:astronomy/application/home/home_store.dart' as _i41;
import 'package:astronomy/application/localization/localization_store.dart'
    as _i7;
import 'package:astronomy/application/settings/settings_store.dart' as _i35;
import 'package:astronomy/application/shared/shared_store.dart' as _i42;
import 'package:astronomy/application/showcase/showcase_store.dart' as _i36;
import 'package:astronomy/application/translator/translator_store.dart' as _i22;
import 'package:astronomy/data/local_data_source.dart' as _i6;
import 'package:astronomy/domain/repositories/apod_repository.dart' as _i23;
import 'package:astronomy/domain/repositories/favorites_repository.dart'
    as _i25;
import 'package:astronomy/domain/repositories/settings_repository.dart' as _i12;
import 'package:astronomy/domain/repositories/showcase_repository.dart' as _i16;
import 'package:astronomy/domain/services/download_service.dart' as _i37;
import 'package:astronomy/domain/services/local_notification_service.dart'
    as _i33;
import 'package:astronomy/domain/services/permissions_service.dart' as _i10;
import 'package:astronomy/domain/services/translator_service.dart' as _i20;
import 'package:astronomy/domain/usecases/favorites/c_favorites_usecase.dart'
    as _i28;
import 'package:astronomy/domain/usecases/favorites/favorites_usecase.dart'
    as _i27;
import 'package:astronomy/domain/usecases/grid/c_grid_usecase.dart' as _i30;
import 'package:astronomy/domain/usecases/grid/grid_usecase.dart' as _i29;
import 'package:astronomy/domain/usecases/home/c_home_usecase.dart' as _i32;
import 'package:astronomy/domain/usecases/home/home_usecase.dart' as _i31;
import 'package:astronomy/domain/usecases/settings/c_settings_usecase.dart'
    as _i15;
import 'package:astronomy/domain/usecases/settings/settings_usecase.dart'
    as _i14;
import 'package:astronomy/domain/usecases/showcase/c_showcase_usecase.dart'
    as _i19;
import 'package:astronomy/domain/usecases/showcase/showcase_usecase.dart'
    as _i18;
import 'package:astronomy/external/external.dart' as _i9;
import 'package:astronomy/external/http/client/api_client.dart' as _i3;
import 'package:astronomy/infraestructure/datasources/local_data_source.dart'
    as _i5;
import 'package:astronomy/infraestructure/repositories/c_apod_repository.dart'
    as _i24;
import 'package:astronomy/infraestructure/repositories/c_favorites_repository.dart'
    as _i26;
import 'package:astronomy/infraestructure/repositories/c_settings_repository.dart'
    as _i13;
import 'package:astronomy/infraestructure/repositories/c_showcase_repository.dart'
    as _i17;
import 'package:astronomy/infraestructure/services/c_download_service.dart'
    as _i38;
import 'package:astronomy/infraestructure/services/c_local_notification_service.dart'
    as _i34;
import 'package:astronomy/infraestructure/services/c_permissions_service.dart'
    as _i11;
import 'package:astronomy/infraestructure/services/c_translator_service.dart'
    as _i21;
import 'package:astronomy/network/services/nasa_open_apis_service.dart' as _i8;
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
    gh.singleton<_i4.ContainerPageStore>(_i4.ContainerPageStore());
    gh.factory<_i5.LocalDataSource>(() => _i6.CLocalDataSource());
    gh.singleton<_i7.LocalizationStore>(_i7.LocalizationStore());
    gh.factory<_i8.NASAOpenAPIsService>(
        () => _i8.NASAOpenAPIsService.create(gh<_i9.ApiClient>()));
    gh.factory<_i10.PermissionsService>(() => _i11.CPermissionsService());
    gh.factory<_i12.SettingsRepository>(
        () => _i13.CSettingsRepository(gh<_i5.LocalDataSource>()));
    gh.factory<_i14.SettingsUseCase>(
        () => _i15.CSettingsUsecase(gh<_i12.SettingsRepository>()));
    gh.factory<_i16.ShowcaseRepository>(
        () => _i17.CShowcaseRepository(gh<_i5.LocalDataSource>()));
    gh.factory<_i18.ShowcaseUseCase>(
        () => _i19.CShowcaseUsecase(gh<_i16.ShowcaseRepository>()));
    gh.factory<_i20.TranslatorService>(() => _i21.CTranslatorService());
    gh.factory<_i22.TranslatorStore>(
        () => _i22.TranslatorStore(gh<_i20.TranslatorService>()));
    gh.factory<_i23.ApodRepository>(
        () => _i24.CApodRepository(gh<_i8.NASAOpenAPIsService>()));
    gh.factory<_i25.FavoritesRepository>(
        () => _i26.CFavoritesRepository(gh<_i5.LocalDataSource>()));
    gh.factory<_i27.FavoritesUseCase>(
        () => _i28.CFavoritesUsecase(gh<_i25.FavoritesRepository>()));
    gh.factory<_i29.GridUseCase>(
        () => _i30.CGridUseCase(gh<_i23.ApodRepository>()));
    gh.factory<_i31.HomeUseCase>(
        () => _i32.CHomeUseCase(gh<_i23.ApodRepository>()));
    gh.factory<_i33.LocalNotificationService>(
        () => _i34.CLocalNotificationService(gh<_i7.LocalizationStore>()));
    gh.singleton<_i35.SettingsStore>(
        _i35.SettingsStore(gh<_i14.SettingsUseCase>()));
    gh.singleton<_i36.ShowCaseStore>(
        _i36.ShowCaseStore(gh<_i18.ShowcaseUseCase>()));
    gh.factory<_i37.DownloadService>(() => _i38.CDownloadService(
          gh<_i33.LocalNotificationService>(),
          gh<_i10.PermissionsService>(),
        ));
    gh.singleton<_i39.FavoriteStore>(
        _i39.FavoriteStore(gh<_i27.FavoritesUseCase>()));
    gh.lazySingleton<_i40.GridPageStore>(
        () => _i40.GridPageStore(gh<_i29.GridUseCase>()));
    gh.lazySingleton<_i41.HomeStore>(
        () => _i41.HomeStore(gh<_i31.HomeUseCase>()));
    gh.factory<_i42.SharedStore>(
        () => _i42.SharedStore(gh<_i37.DownloadService>()));
    return this;
  }
}
