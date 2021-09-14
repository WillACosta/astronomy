import 'package:flutter/material.dart';

import '../../../../domain/entities/media.dart';

import '../../../widgets/widgets.dart'
    show MediaTranslationText, SheetContainer, SheetHandle;

import '../../../utils/utils.dart'
    show
        AppTextStyles,
        getProportionateScreenHeight,
        getProportionateScreenWidth;

class GridScrollableSheet extends StatelessWidget {
  const GridScrollableSheet({
    Key? key,
    required this.media,
  }) : super(key: key);

  final Media media;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.1,
      minChildSize: 0.1,
      maxChildSize: 0.6,
      builder: (_, ScrollController sController) {
        return SheetContainer(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: getProportionateScreenHeight(20),
              horizontal: getProportionateScreenWidth(25),
            ),
            child: ListView(
              controller: sController,
              children: [
                SheetHandle(),
                SizedBox(height: getProportionateScreenHeight(25)),
                MediaTranslationText(
                  isTitleShimmerTile: false,
                  englishTextChild: Text(
                    media.explanation,
                    style: AppTextStyles.body(),
                  ),
                  textToTranslate: media.explanation,
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
