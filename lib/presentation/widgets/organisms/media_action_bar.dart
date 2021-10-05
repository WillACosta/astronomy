import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:social_share/social_share.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

import '../../../application/favorites/favorites_store.dart';
import '../../../external/dependency_injection/locator.dart';
import '../../../application/settings/settings_store.dart';
import '../../../application/shared/shared_store.dart';
import '../../../domain/entities/media.dart';
import '../../routes/route_navigator.dart';
import '../../utils/utils.dart';
import '../widgets.dart';

import 'animated_check_icon.dart';
import 'bookmark_button.dart';

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
  static final _favoriteStore = locator<FavoriteStore>();

  @override
  Widget build(BuildContext context) {
    DateFormat dateFormatter = DateFormat();
    String dateKey = dateFormatter.format(media.date);
    var isDownloadButtonDirty = false;

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        media.mediaType == 'video'
            ? MediaVideoLinkButton(store: _store, media: media)
            : Observer(
                builder: (_) {
                  return OutlinedActionButton(
                    isDark: !_settingsStore.userPreferences.useDarkMode &&
                        isDetailScreen,
                    onPressed: !_store.isDownloadingImage
                        ? () async {
                            await _store.downloadImage(
                              url: _settingsStore.userPreferences.useHdImages
                                  ? media.hdurl!
                                  : media.url,
                            );

                            isDownloadButtonDirty = true;
                          }
                        : null,
                    child: Row(
                      children: [
                        Text(
                          AppLocalizations.of(context)!.download,
                          style: TextStyle(
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                        if (_store.isDownloadingImage)
                          const LoadingIndicator()
                        else if (isDownloadButtonDirty)
                          const AnimatedCheckIcon()
                        else
                          Row()
                      ],
                    ),
                  );
                },
              ),
        media.mediaType == 'image' ? FullScreenButton(media: media) : Row(),
        ValueListenableBuilder(
            valueListenable: _favoriteStore.favoritesBox.listenable(),
            builder: (_, Box box, __) {
              return AnimatedBookmarkButton(
                onPressed: () => _favoriteStore.toggleFavorite(item: media),
                isLiked: _favoriteStore.favoritesBox.containsKey(dateKey)
                    ? true
                    : false,
              );
            }),
        const ShareButton(),
      ],
    );
  }
}

class MediaVideoLinkButton
    extends PlatformWidget<ApodCupertinoIconButton, IconButton> {
  const MediaVideoLinkButton({
    Key? key,
    required this.media,
    required SharedStore store,
  })  : _store = store,
        super(key: key);

  final Media media;
  final SharedStore _store;

  @override
  IconButton createAndroidWidget(BuildContext context) {
    return IconButton(
      onPressed: () => _store.launchUrl(media.url),
      icon: const Icon(
        Icons.link_outlined,
        size: 30,
      ),
    );
  }

  @override
  ApodCupertinoIconButton createIosWidget(BuildContext context) {
    return ApodCupertinoIconButton(
      onPressed: () => _store.launchUrl(media.url),
      icon: CupertinoIcons.link,
    );
  }
}

class FullScreenButton
    extends PlatformWidget<ApodCupertinoIconButton, IconButton> {
  const FullScreenButton({
    Key? key,
    required this.media,
  }) : super(key: key);

  final Media media;

  @override
  IconButton createAndroidWidget(BuildContext context) {
    return IconButton(
      onPressed: () {
        navigateTo(
          context,
          routeName: AppRoutes.imageView,
          args: media,
        );
      },
      icon: const Icon(
        Icons.fullscreen_outlined,
        size: 30,
      ),
    );
  }

  @override
  ApodCupertinoIconButton createIosWidget(BuildContext context) {
    return ApodCupertinoIconButton(
      icon: CupertinoIcons.fullscreen,
      onPressed: () {
        navigateTo(
          context,
          routeName: AppRoutes.imageView,
          args: media,
        );
      },
    );
  }
}

class ShareButton extends PlatformWidget<ApodCupertinoIconButton, IconButton> {
  const ShareButton({Key? key}) : super(key: key);

  @override
  IconButton createAndroidWidget(BuildContext context) {
    return IconButton(
      onPressed: () {
        SocialShare.shareOptions(
          AppLocalizations.of(context)!.shareMessage,
        );
      },
      icon: const Icon(
        Icons.share_outlined,
        size: 25,
      ),
    );
  }

  @override
  ApodCupertinoIconButton createIosWidget(BuildContext context) {
    return ApodCupertinoIconButton(
      icon: CupertinoIcons.share,
      onPressed: () {
        SocialShare.shareOptions(
          AppLocalizations.of(context)!.shareMessage,
        );
      },
    );
  }
}

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 8),
      child: SizedBox(
        width: 15,
        height: 15,
        child: NativeProgressIndicator(),
      ),
    );
  }
}
