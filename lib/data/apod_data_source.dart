import 'package:astronomy/infraestructure/models/media_model.dart';
import 'package:http/http.dart' as http;

import 'package:astronomy/infraestructure/datasources/i_apod_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IApodDataSource)
class ApodDataSource implements IApodDataSource {
  String apiKey = 'ipWNMrnX1YdHoXwjgzVeCeeb8bySpQ2RdYlq8OWJ';

  @override
  Future<MediaModel> getMediaOfTheDay() async {
    final response = await http.get(Uri.parse('https://api.nasa.gov/planetary/apod?api_key=$apiKey'));

    if (response.statusCode == 200) {
      return MediaModel.fromJson(response.body);
    } else {
      throw Exception();
    }
  }
}
