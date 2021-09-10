import 'package:hive/hive.dart';

part 'media.g.dart';

@HiveType(typeId: 2)
class Media extends HiveObject{
  @HiveField(0)
  final String? copyright;

  @HiveField(1)
  final String? hdurl;

  @HiveField(2)
  final DateTime date;

  @HiveField(3)
  final String explanation;

  @HiveField(4)
  final String mediaType;

  @HiveField(5)
  final String title;

  @HiveField(6)
  final String url;

  Media({
    this.copyright,
    this.hdurl,
    required this.date,
    required this.explanation,
    required this.mediaType,
    required this.title,
    required this.url,
  });
}
