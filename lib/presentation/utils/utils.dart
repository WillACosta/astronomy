import 'dart:ui';

import 'package:intl/intl.dart';

import '../../application/localization/localization_store.dart';
import '../../external/dependency_injection/locator.dart';

class Utils {
  static final _localizationStore = locator<LocalizationStore>();

  final dateFormat = DateFormat(
    'yMMMMd',
    _localizationStore.locale?.languageCode == 'pt' ? 'pt_BR' : 'en_US',
  );

  static const animationDuration = Duration(milliseconds: 500);
  final blurFilter = ImageFilter.blur(sigmaX: 5, sigmaY: 5);
}
