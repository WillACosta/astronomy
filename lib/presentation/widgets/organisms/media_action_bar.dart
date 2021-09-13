import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:social_share/social_share.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

import '../../../application/favorites/favorites_store.dart';
import '../../../external/dependency_injection/locator.dart';
import '../../../application/settings/settings_store.dart';
import '../../../application/shared/shared_store.dart';
import '../../../domain/entities/media.dart';
import '../../routes/route_navigator.dart';
import '../../utils/utils.dart';
import '../widgets.dart';

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
                        Text(AppLocalizations.of(context)!.download),
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
        ValueListenableBuilder(
            valueListenable: _favoriteStore.favoritesBox.listenable(),
            builder: (_, Box box, __) {
              return IconButton(
                onPressed: () => _favoriteStore.toggleFavorite(item: media),
                icon: Icon(
                  _favoriteStore.favoritesBox.containsKey(dateKey)
                      ? Icons.bookmark
                      : Icons.bookmark_add_outlined,
                ),
              );
            }),
        IconButton(
          onPressed: () {
            SocialShare.shareOptions(
              AppLocalizations.of(context)!.shareMessage,
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
