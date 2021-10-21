import 'package:flutter/material.dart';

import '../../../../domain/entities/media.dart';

import '../../../utils/exports.dart'
    show
        AppColors,
        AppTextStyles,
        Utils,
        blurFilter,
        getProportionateScreenHeight,
        getProportionateScreenWidth;

class MediaHeader extends StatelessWidget {
  const MediaHeader({Key? key, required this.media}) : super(key: key);

  final Media media;

  static final utils = Utils();

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: blurFilter,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
          vertical: getProportionateScreenHeight(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              media.title,
              style: AppTextStyles.bodyHead(),
              semanticsLabel: 'Media title',
            ),
            Text(
              utils.dateFormat.format(media.date),
              style: AppTextStyles.bodySmallest(color: AppColors.accent),
              semanticsLabel: 'Media date',
            ),
          ],
        ),
      ),
    );
  }
}
