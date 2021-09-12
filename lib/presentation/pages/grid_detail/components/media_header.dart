import 'package:astronomy/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../domain/entities/media.dart' show Media;

import '../../../utils/utils.dart'
    show
        AppColors,
        AppTextStyles,
        getProportionateScreenHeight,
        getProportionateScreenWidth;

class MediaHeader extends StatelessWidget {
  const MediaHeader({Key? key, required this.media}) : super(key: key);

  final Media media;

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd/MM/yyyy');

    return Container(
      color: Theme.of(context).primaryColor,
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenHeight(10),
        horizontal: getProportionateScreenWidth(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MediaTranslationText(
            englishTextChild: Text(
              media.title,
              style: AppTextStyles.bodyHead(),
            ),
            textToTranslate: media.title,
          ),
          Text(
            dateFormat.format(media.date),
            style: AppTextStyles.bodySmallest(color: AppColors.accent),
          ),
        ],
      ),
    );
  }
}
