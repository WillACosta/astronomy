import 'package:astronomy/core/types/network.dart';
import 'package:chopper/chopper.dart';
import 'package:injectable/injectable.dart';

import 'package:astronomy/network/utils/nasa_open_apis_endpoints.dart';
import 'package:astronomy/infraestructure/models/media_model.dart';
import 'package:astronomy/external/external.dart';

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
