import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../application/settings/settings_store.dart';
import '../../../external/dependency_injection/locator.dart';
import '../../../domain/entities/media.dart';
import '../../utils/utils.dart';
import '../../widgets/widgets.dart';

import 'components/grid_scrollable_sheet.dart';
import 'components/media_header.dart';

class GridDetailPage extends StatelessWidget {
  const GridDetailPage({Key? key, required this.media}) : super(key: key);
  final Media media;

  static final _settingsStore = locator<SettingsStore>();

  @override
  Widget build(BuildContext context) {
    AppSizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        actions: [MediaActionBar(media: media)],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          MediaHeader(media: media),
          Padding(
            padding: EdgeInsets.only(top: getProportionateScreenHeight(80)),
            child: media.mediaType == 'image'
                ? CachedNetworkImage(
                    imageUrl: _settingsStore.userPreferences.useHdImages
                        ? media.hdurl!
                        : media.url,
                    fit: BoxFit.cover,
                  )
                : Image.asset(AppImages.videoIllustration),
          ),
          GridScrollableSheet(media: media),
        ],
      ),
    );
  }
}
