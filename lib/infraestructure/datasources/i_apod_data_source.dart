import '../models/media_model.dart';

abstract class IApodDataSource {
  Future<MediaModel> getMediaOfTheDay();
}