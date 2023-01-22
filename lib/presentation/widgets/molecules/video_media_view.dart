import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../utils/utils.dart';

class VideoMediaView extends StatelessWidget {
  const VideoMediaView({Key? key, this.showLabel}) : super(key: key);

  final bool? showLabel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Container(
          width: 55,
          height: 55,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Icon(
              Icons.play_arrow,
              color: Theme.of(context).primaryColor,
              size: 35,
              semanticLabel:
                  'This is a video icon, to open touch on the link in the top right of the screen',
            ),
          ),
        ),
        SizedBox(height: getProportionateScreenHeight(10)),
        showLabel == true
            ? Column(
                children: [
                  Text(
                    AppLocalizations.of(context)!.thisIsAVideo,
                    style: AppTextStyles.body(color: AppColors.accent),
                  ),
                  Text(
                    AppLocalizations.of(context)!.toSeeVideo,
                    style: AppTextStyles.bodySmall(color: AppColors.accent),
                  ),
                ],
              )
            : const SizedBox(),
        const Spacer(),
      ],
    );
  }
}
