import 'dart:convert';

import 'package:astronomy/domain/entities/media.dart';

class MediaModel extends Media {
  MediaModel({
    String? copyright,
    required DateTime date,
    required String explanation,
    required String hdurl,
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

  Map<String, dynamic> toMap() {
    return {
      'copyright': copyright,
      'date': date.millisecondsSinceEpoch,
      'explanation': explanation,
      'hdurl': hdurl,
      'mediaType': mediaType,
      'title': title,
      'url': url,
    };
  }

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

  String toJson() => json.encode(toMap());

  factory MediaModel.fromJson(String source) =>
      MediaModel.fromMap(json.decode(source));

  static List<MediaModel> fromJsonList(String source) {
    var sourceList = json.decode(source) as List;
    return sourceList.map((e) => MediaModel.fromMap(e)).toList();
  }
}
