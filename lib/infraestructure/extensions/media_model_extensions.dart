import '../../domain/models/media.dart';
import '../models/media_model.dart';

extension MediaModelExtensions on MediaModel {
  Media toMedia() {
    return Media(
      copyright: copyright,
      hdurl: hdurl,
      date: date,
      explanation: explanation,
      mediaType: mediaType,
      title: title,
      url: url,
    );
  }
}

extension MediaListModelExtension on List<MediaModel> {
  List<Media> toMediaList() {
    return map((e) => e.toMedia()).toList();
  }
}
