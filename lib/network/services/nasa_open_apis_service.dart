import '../../core/types/network.dart';
import 'package:chopper/chopper.dart';
import 'package:injectable/injectable.dart';

import '../utils/nasa_open_apis_endpoints.dart';
import '../../infraestructure/models/media_model.dart';
import '../../external/external.dart';

part 'nasa_open_apis_service.chopper.dart';

@injectable
@ChopperApi()
abstract class NASAOpenAPIsService extends ChopperService {
  @factoryMethod
  static NASAOpenAPIsService create(ApiClient client) {
    return _$NASAOpenAPIsService(client);
  }

  @Get(path: NasaOpenAPISEndpoints.apodEndpoint)
  AsyncResponse<MediaModel> getMediaOfTheDay();

  @Get(path: NasaOpenAPISEndpoints.apodEndpoint)
  AsyncResponse<List<MediaModel>> getMediaList(
    @Query('start_date') String startDate,
    @Query('end_date') String endDate,
  );
}
