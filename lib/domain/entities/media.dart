class Media {
  final String? copyright;
  final String? hdurl;
  final DateTime date;
  final String explanation;
  final String mediaType;
  final String title;
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
