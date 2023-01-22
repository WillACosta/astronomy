import 'dart:convert';

import '../../domain/models/media.dart';

class MediaModel extends Media {
  const MediaModel({
    String? copyright,
    required DateTime date,
    required String explanation,
    String? hdurl,
    required String mediaType,
    required String title,
    required String url,
  }) : super(
          copyright: copyright,
          date: date,
          explanation: explanation,
          hdurl: hdurl,
          mediaType: mediaType,
          title: title,
          url: url,
        );

  factory MediaModel.fromMap(Map<String, dynamic> map) {
    return MediaModel(
      copyright: map['copyright'],
      date: DateTime.parse(map['date']),
      explanation: map['explanation'],
      hdurl: map['hdurl'],
      mediaType: map['media_type'],
      title: map['title'],
      url: map['url'],
    );
  }

  factory MediaModel.fromJson(String source) =>
      MediaModel.fromMap(json.decode(source));

  static List<MediaModel> fromJsonList(String source) {
    var sourceList = json.decode(source) as List;
    return sourceList.map((e) => MediaModel.fromMap(e)).toList();
  }
}
