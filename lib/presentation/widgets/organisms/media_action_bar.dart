import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:social_share/social_share.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

import 'package:astronomy/application/favorites/favorites_store.dart';
import 'package:astronomy/external/dependency_injection/locator.dart';
import 'package:astronomy/application/settings/settings_store.dart';
import 'package:astronomy/application/shared/shared_store.dart';
import 'package:astronomy/domain/entities/media.dart';
import 'package:astronomy/presentation/routes/route_navigator.dart';
import 'package:astronomy/presentation/utils/utils.dart';
import 'package:astronomy/presentation/widgets/widgets.dart';

import 'package:astronomy/presentation/widgets/organisms/animated_check_icon.dart';
import 'package:astronomy/presentation/widgets/organisms/bookmark_button.dart';

class MediaActionBar extends StatelessWidget {
  const MediaActionBar({
    Key? key,
    required this.isDetailScreen,
    required this.media,
  }) : super(key: key);

  final bool isDetailScreen;
  final Media media;

  static final _store = serviceLocator<SharedStore>();
  static final _settingsStore = serviceLocator<SettingsStore>();
  static final _favoriteStore = serviceLocator<FavoriteStore>();

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
            ? MediaVideoLinkButton(
                store: _store,
                media: media,
                isDarkIcons: isDetailScreen,
              )
            : Observer(
                builder: (_) {
                  return OutlinedActionButton(
                    semanticLabel: 'Download image button',
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
                        Text(AppLocalizations.of(context)!.download),
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
        media.mediaType == 'image'
            ? FullScreenButton(
                media: media,
                isDarkIcons: isDetailScreen,
              )
            : Row(),
        ValueListenableBuilder(
          valueListenable: _favoriteStore.favoritesBox.listenable(),
          builder: (_, Box box, __) {
            return AnimatedBookmarkButton(
              onPressed: () => _favoriteStore.toggleFavorite(item: media),
              isLiked: _favoriteStore.favoritesBox.containsKey(dateKey)
                  ? true
                  : false,
            );
          },
        ),
        ShareButton(isDarkIcons: isDetailScreen),
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
    required this.isDarkIcons,
  })  : _store = store,
        super(key: key);

  final Media media;
  final SharedStore _store;
  final bool isDarkIcons;

  @override
  IconButton createAndroidWidget(BuildContext context) {
    return IconButton(
      onPressed: () => _store.launchUrl(media.url),
      icon: const Icon(
        Icons.link_outlined,
        size: 30,
        semanticLabel: 'Video link button',
      ),
    );
  }

  @override
  ApodCupertinoIconButton createIosWidget(BuildContext context) {
    return ApodCupertinoIconButton(
      isDarkIcons: isDarkIcons,
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
    required this.isDarkIcons,
  }) : super(key: key);

  final bool isDarkIcons;
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
        semanticLabel: 'Fullscreen button to view media',
      ),
    );
  }

  @override
  ApodCupertinoIconButton createIosWidget(BuildContext context) {
    return ApodCupertinoIconButton(
      isDarkIcons: isDarkIcons,
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
  const ShareButton({
    Key? key,
    required this.isDarkIcons,
  }) : super(key: key);

  final bool isDarkIcons;

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
        semanticLabel: 'Social share button',
      ),
    );
  }

  @override
  ApodCupertinoIconButton createIosWidget(BuildContext context) {
    return ApodCupertinoIconButton(
      isDarkIcons: isDarkIcons,
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
