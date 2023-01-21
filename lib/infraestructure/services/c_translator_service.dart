import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:translator/translator.dart';

import 'package:astronomy/domain/services/translator_service.dart';

@Injectable(as: TranslatorService)
class CTranslatorService implements TranslatorService {
  static final translator = GoogleTranslator();
  DateFormat dateFormatter = DateFormat();

  @override
  Future<String> translateFromTo({
    required String text,
    String from = 'en',
    String to = 'pt',
  }) async {
    var translation = await translator.translate(text, to: 'pt');
    return translation.text;
  }
}
