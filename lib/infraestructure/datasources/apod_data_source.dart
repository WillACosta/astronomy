import '../models/media_model.dart';

abstract class ApodDataSource {
  Future<MediaModel> getMediaOfTheDay();
  Future<List<MediaModel>> getMediaList();
}