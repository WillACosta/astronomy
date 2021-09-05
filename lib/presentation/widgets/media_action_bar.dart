import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:social_share/social_share.dart';

import '../../external/dependency_injection/locator.dart';
import '../../application/settings/settings_store.dart';
import '../../application/shared/shared_store.dart';
import '../../domain/entities/media.dart';
import '../routes/route_navigator.dart';
import '../utils/utils.dart';
import 'outlined_action_button.dart';

class MediaActionBar extends StatelessWidget {
  const MediaActionBar({
    Key? key,
    required this.isDetailScreen,
    required this.media,
  }) : super(key: key);

  final bool isDetailScreen;
  final Media media;

  static final _store = locator<SharedStore>();
  static final _settingsStore = locator<SettingsStore>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        media.mediaType == 'video'
            ? IconButton(
                onPressed: () => _store.launchUrl(media.url),
                icon: Icon(Icons.link_outlined),
              )
            : Observer(
                builder: (_) {
                  return OutlinedActionButton(
                    isDark: !_settingsStore.userPreferences.useDarkMode &&
                        isDetailScreen,
                    onPressed: () async => !_store.isDownloadingImage
                        ? await _store.downloadImage(url: media.url)
                        : () => null,
                    child: Row(
                      children: [
                        Text('Download'),
                        _store.isDownloadingImage ? LoadingIndicator() : Row(),
                      ],
                    ),
                  );
                },
              ),
        media.mediaType == 'image'
            ? IconButton(
                onPressed: () {
                  navigateTo(
                    context,
                    routeName: AppRoutes.imageView,
                    args: media,
                  );
                },
                icon: Icon(Icons.fullscreen_outlined, size: 30),
              )
            : Row(),
        IconButton(
          onPressed: () async {
            SocialShare.shareOptions(
              "Found this awesome media on Astronomy app, i think you'll like it!",
            );
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
