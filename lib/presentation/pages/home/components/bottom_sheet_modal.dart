import 'package:flutter/material.dart';

import '../../../../domain/entities/media.dart';
import '../../../widgets/widgets.dart';
import 'media_text_content.dart';

import '../../../utils/exports.dart'
    show getProportionateScreenHeight, getProportionateScreenWidth;

class BottomSheetModal extends StatelessWidget {
  final Media media;
  const BottomSheetModal({Key? key, required this.media}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(right: getProportionateScreenWidth(20)),
          child: MediaActionBar(
            media: media,
            isDetailScreen: false,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: getProportionateScreenHeight(55)),
          child: SheetContainer(
            child: MediaTextContent(media: media),
          ),
        ),
      ],
    );
  }
}
