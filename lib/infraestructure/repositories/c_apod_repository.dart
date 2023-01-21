import 'package:astronomy/network/utils/safe_api_call.dart';
import 'package:injectable/injectable.dart';

import 'package:astronomy/network/services/nasa_open_apis_service.dart';
import 'package:astronomy/domain/repositories/apod_repository.dart';
import 'package:astronomy/domain/models/media.dart';
import 'package:astronomy/core/types/types.dart';

@Injectable(as: ApodRepository)
class CApodRepository implements ApodRepository {
  final NASAOpenAPIsService _service;

  CApodRepository(this._service);

  @override
  AsyncEither<List<Media>> getMediaList({
    required String startDate,
    required String endDate,
  }) {
    // TODO: implement getMediaList
    throw UnimplementedError();
  }

  @override
  AsyncEither<Media> getMediaOfTheDay() {
    return safeApiCall<Media>(_service.getMediaOfTheDay);
  }
}
