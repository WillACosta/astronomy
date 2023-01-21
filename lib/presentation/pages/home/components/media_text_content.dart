import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:astronomy/domain/entities/media.dart';
import 'package:astronomy/presentation/utils/utils.dart';

class MediaTextContent extends StatelessWidget {
  const MediaTextContent({
    Key? key,
    required this.dateFormat,
    required this.media,
  }) : super(key: key);

  final DateFormat dateFormat;
  final Media media;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(30),
      children: [
        Text(
          dateFormat.format(media.date),
          style: AppTextStyles.bodySmall(color: AppColors.accent),
          textAlign: TextAlign.center,
          semanticsLabel: 'Today date',
        ),
        SizedBox(height: getProportionateScreenHeight(10)),
        // MediaTranslationText(
        //   isTitleShimmerTile: true,
        //   englishTextChild: Text(media.title, style: AppTextStyles.bodyHead()),
        //   textToTranslate: media.title,
        // ),
        Text(
          media.title,
          style: AppTextStyles.bodyHead(),
          textAlign: TextAlign.center,
          semanticsLabel: 'Media title',
        ),
        SizedBox(height: getProportionateScreenHeight(25)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
              semanticsLabel: 'Media explanation',
            ),
            SizedBox(height: getProportionateScreenHeight(25)),
            media.copyright != null
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.copyright,
                        style: AppTextStyles.bodyHead(),
                        semanticsLabel: 'Copyright owner',
                      ),
                      SizedBox(height: getProportionateScreenHeight(10)),
                      Text(
                        media.copyright!,
                        style: AppTextStyles.body(),
                      ),
                    ],
                  )
                : Container(),
            SizedBox(height: getProportionateScreenHeight(10)),
          ],
        ),
      ],
    );
  }
}
