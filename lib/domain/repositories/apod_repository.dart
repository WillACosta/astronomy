import '../../core/types/types.dart';

abstract class ApodRepository {
  MediaOfTheDayType getMediaOfTheDay();
  ListOfMediaType getMediaList();
}