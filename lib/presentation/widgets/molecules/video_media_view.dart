import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../utils/utils.dart' show getProportionateScreenHeight;

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
            color: Theme.of(context).accentColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Icon(
              Icons.play_arrow,
              color: Theme.of(context).primaryColor,
              size: 35,
            ),
          ),
        ),
        SizedBox(height: getProportionateScreenHeight(10)),
        showLabel == true
            ? Text(AppLocalizations.of(context)!.thisIsAVideo)
            : const SizedBox(),
        const Spacer(),
      ],
    );
  }
}
