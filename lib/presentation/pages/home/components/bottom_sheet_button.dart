import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../../../../domain/entities/media.dart';
import '../../../utils/utils.dart';

import 'bottom_sheet_modal.dart';

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
        onTap: () => showModalBottomSheet(
          context: context,
          backgroundColor: Colors.transparent,
          isDismissible: true,
          builder: (_) => BottomSheetModal(media: media),
        ),
        child: const Icon(
          FeatherIcons.chevronUp,
          color: AppColors.secondary,
          size: 25,
          semanticLabel: 'Arrow up media details button',
        ),
      ),
    );
  }
}
