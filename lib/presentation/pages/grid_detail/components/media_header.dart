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
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenHeight(10),
        horizontal: getProportionateScreenWidth(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(media.title, style: AppTextStyles.bodyHead),
          Text(
            dateFormat.format(media.date),
            style: AppTextStyles.bodySmallest(color: AppColors.accent),
          ),
        ],
      ),
    );
  }
}
