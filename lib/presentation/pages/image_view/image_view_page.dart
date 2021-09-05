import 'package:astronomy/external/dependency_injection/locator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../application/settings/settings_store.dart';
import '../../../domain/entities/media.dart';

class ImageView extends StatelessWidget {
  const ImageView({Key? key, required this.media}) : super(key: key);

  final Media media;

  static final _store = locator<SettingsStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
      ),
      body: Center(
        child: CachedNetworkImage(
          imageUrl: _store.userPreferences.useHdImages
              ? media.hdurl!
              : media.url,
        ),
      ),
    );
  }
}
