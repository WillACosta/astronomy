import 'package:flutter/material.dart';

import '../../../../domain/models/media.dart';
import 'bottom_sheet_modal.dart';

void showSheetModal(BuildContext context, Media media) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (_) => BottomSheetModal(media: media),
  );
}
