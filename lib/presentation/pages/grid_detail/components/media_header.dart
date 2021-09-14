import 'package:flutter/material.dart';

import '../../../../external/dependency_injection/locator.dart';
import '../../../../application/shared/shared_store.dart';
import '../../../../domain/entities/media.dart';
import '../../../widgets/widgets.dart';

import '../../../utils/utils.dart'
    show
        AppColors,
        AppTextStyles,
        getProportionateScreenHeight,
        getProportionateScreenWidth;

class MediaHeader extends StatelessWidget {
  const MediaHeader({Key? key, required this.media}) : super(key: key);

  final Media media;

  static final _sharedStore = locator<SharedStore>();

  @override
  Widget build(BuildContext context) {
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
            isTitleShimmerTile: true,
            englishTextChild: Text(
              media.title,
              style: AppTextStyles.bodyHead(),
            ),
            textToTranslate: media.title,
          ),
          Text(
            _sharedStore.dateFormat.format(media.date),
            style: AppTextStyles.bodySmallest(color: AppColors.accent),
          ),
        ],
      ),
    );
  }
}
