import 'package:injectable/injectable.dart';

import '../extensions/media_model_extensions.dart';
import '../../network/services/nasa_open_apis_service.dart';
import '../../domain/repositories/apod_repository.dart';
import '../../network/utils/safe_api_call.dart';
import '../../domain/models/media.dart';
import '../../core/types/types.dart';

@Injectable(as: ApodRepository)
class CApodRepository implements ApodRepository {
  final NASAOpenAPIsService _service;

  CApodRepository(this._service);

  @override
  AsyncEither<List<Media>> getMediaList({
    required String startDate,
    required String endDate,
  }) async {
    final foldable = await safeApiCall(
      () => _service.getMediaList(startDate, endDate),
    );

    return foldable.map((r) => r.toMediaList());
  }

  @override
  AsyncEither<Media> getMediaOfTheDay() async {
    final foldable = await safeApiCall(() => _service.getMediaOfTheDay());
    return foldable.map((r) => r.toMedia());
  }
}
