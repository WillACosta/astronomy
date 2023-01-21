// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nasa_open_apis_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$NASAOpenAPIsService extends NASAOpenAPIsService {
  _$NASAOpenAPIsService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = NASAOpenAPIsService;

  @override
  Future<Response<MediaModel>> getMediaOfTheDay() {
    final Uri $url = Uri.parse('apod');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<MediaModel, MediaModel>($request);
  }

  @override
  Future<Response<List<MediaModel>>> getMediaList(
    String startDate,
    String endDate,
  ) {
    final Uri $url = Uri.parse('apod');
    final Map<String, dynamic> $params = <String, dynamic>{
      'start_date': startDate,
      'end_date': endDate,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<List<MediaModel>, MediaModel>($request);
  }
}
