import 'package:flutter/material.dart';

import '../../../../domain/entities/media.dart';
import '../../../widgets/widgets.dart';

import '../../../utils/utils.dart'
    show
        AppTextStyles,
        getProportionateScreenHeight,
        getProportionateScreenWidth;

class GridScrollableSheet extends StatelessWidget {
  const GridScrollableSheet({
    Key? key,
    required this.media,
    required this.showcaseKey,
  }) : super(key: key);

  final Media media;
  final GlobalKey showcaseKey;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.1,
      minChildSize: 0.1,
      maxChildSize: 0.6,
      builder: (context, ScrollController sController) {
        return SheetContainer(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: getProportionateScreenHeight(20),
              horizontal: getProportionateScreenWidth(25),
            ),
            child: ListView(
              controller: sController,
              children: [
                ApodShowcase(
                  description: 'Swipe up to view an explanation of this media',
                  showcaseKey: showcaseKey,
                  child: const SheetHandle(),
                ),
                SizedBox(height: getProportionateScreenHeight(25)),
                // MediaTranslationText(
                //   isTitleShimmerTile: false,
                //   englishTextChild: Text(
                //     media.explanation,
                //     style: AppTextStyles.body(),
                //   ),
                //   textToTranslate: media.explanation,
                // ),
                Text(
                  media.explanation,
                  style: AppTextStyles.body(),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: getProportionateScreenHeight(25)),
                media.copyright != null
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Copyright',
                            style: AppTextStyles.bodyHead(),
                          ),
                          SizedBox(height: getProportionateScreenHeight(10)),
                          Text(
                            media.copyright!,
                            style: AppTextStyles.body(),
                          ),
                        ],
                      )
                    : Container(),
              ],
            ),
          ),
        );
      },
    );
  }
}
