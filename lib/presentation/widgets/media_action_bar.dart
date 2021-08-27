import 'package:flutter/material.dart';
import 'package:social_share/social_share.dart';

import '../utils/utils.dart';

class MediaActionBar extends StatelessWidget {
  const MediaActionBar({
    Key? key,
    this.isDark,
  }) : super(key: key);

  final bool? isDark;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        OutlinedButton(
          onPressed: () {},
          child: Text(
            'Download',
            style: isDark != null && isDark == true
                ? AppTextStyles.body(color: AppColors.primary)
                : AppTextStyles.body(color: AppColors.secondary),
          ),
        ),
        SizedBox(width: getProportionateScreenWidth(10)),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.fullscreen_outlined, size: 30),
        ),
        IconButton(
          onPressed: () {
            SocialShare.shareOptions('Check the awesome picture');
          },
          icon: Icon(Icons.share_outlined, size: 25),
        ),
      ],
    );
  }
}
