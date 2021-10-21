import 'package:intl/intl.dart';

import '../../application/localization/localization_store.dart';
import '../../external/dependency_injection/locator.dart';

class Utils {
  static final _localizationStore = locator<LocalizationStore>();

  final dateFormat = DateFormat(
    'yMMMMd',
    _localizationStore.locale?.languageCode == 'pt' ? 'pt_BR' : 'en_US',
  );
}
