import 'package:flutter/material.dart';

import '../../../domain/entities/media.dart';
import '../../utils/exports.dart' show AppColors, AppTextStyles, Utils;

class ApodMediaTitle extends StatelessWidget {
  const ApodMediaTitle({
    Key? key,
    required this.media,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  }) : super(key: key);

  final Media media;
  final CrossAxisAlignment crossAxisAlignment;

  static final utils = Utils();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
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
    );
  }
}
