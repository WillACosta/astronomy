import '../../core/types/types.dart';
import '../models/media.dart';

abstract class ApodRepository {
  AsyncEither<Media> getMediaOfTheDay();

  AsyncEither<List<Media>> getMediaList({
    required String startDate,
    required String endDate,
  });
}
