import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import 'package:astronomy/domain/services/translator_service.dart';

part 'translator_store.g.dart';

@Injectable()
class TranslatorStore = _TranslatorStoreBase with _$TranslatorStore;

abstract class _TranslatorStoreBase with Store {
  final TranslatorService _translatorService;
  late Box translationBox;

  _TranslatorStoreBase(this._translatorService);

  @action
  Future<String> translate(String text) async {
    return await _translatorService.translateFromTo(text: text);
  }
}
