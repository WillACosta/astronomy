import 'package:astronomy/infraestructure/models/media_model.dart';

abstract class MockMedia {
  static final media = MediaModel(
    date: DateTime.parse('2012-02-27'),
    explanation: 'an awesome picture of our sky',
    mediaType: 'image',
    title: 'Ancient Sky',
    url: 'http.api.fake',
  );
}
