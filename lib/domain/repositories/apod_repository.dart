import 'package:astronomy/core/types/types.dart';

abstract class ApodRepository {
  MediaOfTheDayType getMediaOfTheDay();

  ListOfMediaType getMediaList({
    required String startDate,
    required String endDate,
  });
}
