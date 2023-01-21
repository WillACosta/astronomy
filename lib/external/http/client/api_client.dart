import 'package:chopper/chopper.dart';
import 'package:injectable/injectable.dart';

import 'package:astronomy/network/utils/nasa_open_apis_endpoints.dart';
import 'package:astronomy/external/http/converters/json_serializable_converter.dart';

@lazySingleton
class ApiClient extends ChopperClient {
  ApiClient()
      : super(
          baseUrl: Uri.parse(NasaOpenAPISEndpoints.baseURL),
          converter: const JsonSerializableConverter(),
          interceptors: [HttpLoggingInterceptor()],
        );
}
