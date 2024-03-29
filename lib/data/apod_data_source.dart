import 'package:injectable/injectable.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import 'package:astronomy/infraestructure/models/media_model.dart';
import 'package:astronomy/infraestructure/datasources/apod_data_source.dart';

@Injectable(as: ApodDataSource)
class CApodDataSource implements ApodDataSource {
  final baseUrl = 'https://api.nasa.gov/planetary/apod';
  final apiKey = dotenv.env['API_KEY']!;

  @override
  Future<MediaModel> getMediaOfTheDay() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl?api_key=$apiKey'));

      if (response.statusCode == 200) {
        return MediaModel.fromJson(response.body);
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<MediaModel>> getMediaList({
    required String startDate,
    required String endDate,
  }) async {
    try {
      final response = await http.get(
        Uri.parse(
          '$baseUrl?api_key=$apiKey&start_date=$startDate&end_date=$endDate',
        ),
      );

      if (response.statusCode == 200) {
        return MediaModel.fromJsonList(response.body);
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
