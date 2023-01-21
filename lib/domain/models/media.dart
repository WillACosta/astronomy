import 'package:equatable/equatable.dart';

class Media extends Equatable {
  final String? copyright;
  final String? hdurl;
  final DateTime date;
  final String explanation;
  final String mediaType;
  final String title;
  final String url;

  const Media({
    this.copyright,
    this.hdurl,
    required this.date,
    required this.explanation,
    required this.mediaType,
    required this.title,
    required this.url,
  });

  @override
  List<Object?> get props => [
        copyright,
        hdurl,
        date,
        explanation,
        mediaType,
        title,
        url,
      ];
}
