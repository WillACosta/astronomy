import 'package:flutter/material.dart';

import '../../../../external/dependency_injection/locator.dart';
import '../../../../application/shared/shared_store.dart';
import '../../../../domain/models/media.dart';

import '../../../utils/utils.dart'
    show
        AppColors,
        AppTextStyles,
        blurFilter,
        getProportionateScreenHeight,
        getProportionateScreenWidth;

class MediaHeader extends StatelessWidget {
  const MediaHeader({Key? key, required this.media}) : super(key: key);

  final Media media;

  static final _sharedStore = serviceLocator<SharedStore>();

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
              _sharedStore.dateFormat.format(media.date),
              style: AppTextStyles.bodySmallest(color: AppColors.accent),
              semanticsLabel: 'Media date',
            ),
          ],
        ),
      ),
    );
  }
}
