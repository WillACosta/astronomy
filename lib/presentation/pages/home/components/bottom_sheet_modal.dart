import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../domain/entities/media.entity.dart';
import '../../../widgets/widgets.dart';
import 'media_text_content.dart';

import '../../../utils/utils.dart'
    show getProportionateScreenHeight, getProportionateScreenWidth;

class BottomSheetModal extends StatelessWidget {
  final Media media;
  const BottomSheetModal({Key? key, required this.media}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat.yMEd();

    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(right: getProportionateScreenWidth(20)),
          child: MediaActionBar(),
        ),
        Padding(
          padding: EdgeInsets.only(top: getProportionateScreenHeight(55)),
          child: SheetContainer(
            child: MediaTextContent(dateFormat: dateFormat, media: media),
          ),
        ),
      ],
    );
  }
}
