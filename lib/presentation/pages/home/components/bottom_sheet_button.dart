import 'package:flutter/material.dart';

import 'bottom_sheet_modal.dart';
import '../../../../domain/entities/media.dart';

class BottomSheetButton extends StatelessWidget {
  final Media media;

  const BottomSheetButton({
    Key? key,
    required this.media,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: GestureDetector(
        onTap: () => showModalBottomSheet(
          context: context,
          backgroundColor: Colors.transparent,
          builder: (_) => BottomSheetModal(media: media),
        ),
        child: Icon(
          Icons.expand_less_outlined,
          size: 30,
        ),
      ),
    );
  }
}
