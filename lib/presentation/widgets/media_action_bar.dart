import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:social_share/social_share.dart';

import '../../external/dependency_injection/locator.dart';
import '../../application/shared/shared_store.dart';
import '../../domain/entities/media.dart';
import '../utils/utils.dart';

class MediaActionBar extends StatelessWidget {
  const MediaActionBar({
    Key? key,
    this.isDark,
    required this.media,
  }) : super(key: key);

  final bool? isDark;
  final Media media;

  static final _store = locator<SharedStore>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Observer(
          builder: (_) {
            return OutlinedButton(
              onPressed: _store.isDownloadingImage
                  ? null
                  : () async => await _store.downloadImage(url: media.url),
              child: Row(
                children: [
                  Text(
                    'Download',
                    style: isDark != null && isDark == true
                        ? AppTextStyles.body(color: AppColors.primary)
                        : AppTextStyles.body(color: AppColors.secondary),
                  ),
                  _store.isDownloadingImage ? LoadingIndicator() : Row(),
                ],
              ),
            );
          },
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

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: SizedBox(
        width: 15,
        height: 15,
        child: CircularProgressIndicator(
          color: Theme.of(context).accentColor,
          strokeWidth: 1,
          semanticsLabel: 'Loading indicator',
        ),
      ),
    );
  }
}
