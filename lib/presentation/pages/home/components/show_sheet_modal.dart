import 'package:flutter/material.dart';

import 'package:astronomy/domain/models/media.dart';
import 'package:astronomy/presentation/pages/home/components/bottom_sheet_modal.dart';

void showSheetModal(BuildContext context, Media media) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (_) => BottomSheetModal(media: media),
  );
}
