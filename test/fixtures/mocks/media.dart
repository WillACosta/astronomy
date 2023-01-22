import 'package:astronomy/domain/models/media.dart';
import 'package:astronomy/infraestructure/models/media_model.dart';

abstract class MockMedia {
  static final mediaModel = MediaModel(
    copyright: 'Astronomy',
    hdurl: 'http.api.fake/hd',
    date: DateTime.parse('2012-02-27'),
    explanation: 'an awesome picture of our sky',
    mediaType: 'image',
    title: 'Ancient Sky',
    url: 'http.api.fake',
  );

  static final media = Media(
    copyright: 'Astronomy',
    hdurl: 'http.api.fake/hd',
    date: DateTime.parse('2012-02-27'),
    explanation: 'an awesome picture of our sky',
    mediaType: 'image',
    title: 'Ancient Sky',
    url: 'http.api.fake',
  );

  static const mediaDate = '2012-02-27';
  static final mediaModelList = List.of([mediaModel]);
  static final mediaList = List.of([media]);
}
