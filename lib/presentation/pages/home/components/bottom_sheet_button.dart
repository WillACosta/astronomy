import 'package:flutter/material.dart';

import '../../../../domain/entities/media.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/utils.dart';

import 'show_sheet_modal.dart';

class BottomSheetButton extends StatelessWidget {
  final Media media;

  const BottomSheetButton({
    Key? key,
    required this.media,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: getProportionateScreenHeight(10)),
      child: GestureDetector(
        onTap: () => showSheetModal(context, media),
        child: const Icon(
          Icons.expand_less_outlined,
          color: AppColors.secondary,
          size: 30,
        ),
      ),
    );
  }
}
