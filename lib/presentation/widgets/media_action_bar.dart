import 'package:flutter/material.dart';
import 'package:social_share/social_share.dart';

import '../utils/utils.dart';

class MediaActionBar extends StatelessWidget {
  const MediaActionBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        OutlinedButton(
          onPressed: () {},
          child: Text(
            'Download',
            style: AppTextStyles.body,
          ),
        ),
        SizedBox(width: getProportionateScreenWidth(15)),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.fullscreen_outlined, size: 35),
        ),
        SizedBox(width: getProportionateScreenWidth(3)),
        IconButton(
          onPressed: () {
            SocialShare.shareOptions('Check the awesome picture');
          },
          icon: Icon(Icons.share_outlined, size: 30),
        ),
      ],
    );
  }
}
