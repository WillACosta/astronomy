import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

import 'package:astronomy/external/dependency_injection/locator.dart';
import 'package:astronomy/application/settings/settings_store.dart';
import 'package:astronomy/domain/entities/media.dart';

class ApodNetworkImage extends StatelessWidget {
  const ApodNetworkImage({
    Key? key,
    required this.media,
  }) : super(key: key);

  final Media media;
  static final _settingsStore = serviceLocator<SettingsStore>();

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'This is an image: ${media.title}',
      child: CachedNetworkImage(
        imageUrl: _settingsStore.userPreferences.useHdImages
            ? media.hdurl!
            : media.url,
        fit: BoxFit.cover,
      ),
    );
  }
}
