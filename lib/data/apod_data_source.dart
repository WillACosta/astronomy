import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;

import '../infraestructure/models/media_model.dart';
import '../infraestructure/datasources/apod_data_source.dart';

@Injectable(as: ApodDataSource)
class CApodDataSource implements ApodDataSource {
  String apiKey = 'ipWNMrnX1YdHoXwjgzVeCeeb8bySpQ2RdYlq8OWJ';

  @override
  Future<MediaModel> getMediaOfTheDay() async {
    final response = await http.get(
      Uri.parse('https://api.nasa.gov/planetary/apod?api_key=$apiKey'),
    );

    if (response.statusCode == 200) {
      return MediaModel.fromJson(response.body);
    } else {
      throw Exception();
    }
  }

  @override
  Future<List<MediaModel>> getMediaList() async {
    var startDate = '2021-08-08';
    var endDate = '2021-08-15';

    final response = await http.get(
      Uri.parse(
          'https://api.nasa.gov/planetary/apod?api_key=$apiKey&start_date=$startDate&end_date=$endDate'),
    );

    if (response.statusCode == 200) {
      return MediaModel.fromJsonList(response.body);
    } else {
      throw Exception();
    }
  }
}
