abstract class TranslatorService {
  Future<String> translateFromTo({
    required String text,
    String from = 'en',
    String to = 'pt',
  });
}
