import '../../domain/models/media.dart';
import 'package:hive/hive.dart';

part 'media_entity.g.dart';

@HiveType(typeId: 2)
class MediaEntity extends Media {
  const MediaEntity({
    @HiveField(0) String? copyright,
    @HiveField(1) required DateTime date,
    @HiveField(2) required String explanation,
    @HiveField(3) String? hdurl,
    @HiveField(4) required String mediaType,
    @HiveField(5) required String title,
    @HiveField(6) required String url,
  }) : super(
          copyright: copyright,
          date: date,
          explanation: explanation,
          hdurl: hdurl,
          mediaType: mediaType,
          title: title,
          url: url,
        );
}
