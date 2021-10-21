import 'package:astronomy/presentation/utils/app_size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../domain/entities/media.dart';

import '../../../utils/exports.dart'
    show AppTextStyles, Utils, getProportionateScreenHeight;

import '../../../widgets/widgets.dart' show ApodMediaTitle;

class MediaTextContent extends StatelessWidget {
  const MediaTextContent({
    Key? key,
    required this.media,
  }) : super(key: key);

  static final utils = Utils();
  final Media media;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(30),
      ),
      children: [
        ApodMediaTitle(
          media: media,
          crossAxisAlignment: CrossAxisAlignment.center,
        ),
        SizedBox(height: getProportionateScreenHeight(25)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                : Row(),
            SizedBox(height: getProportionateScreenHeight(10)),
          ],
        ),
      ],
    );
  }
}
