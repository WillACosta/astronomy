import 'package:astronomy/infraestructure/models/media_model.dart';

abstract class MockMedia {
  static final media = MediaModel(
    copyright: 'Astronomy',
    hdurl: 'http.api.fake/hd',
    date: DateTime.parse('2012-02-27'),
    explanation: 'an awesome picture of our sky',
    mediaType: 'image',
    title: 'Ancient Sky',
    url: 'http.api.fake',
  );

  static const mediaDate = '2012-02-27';
  static final mediaList = [media];
}
