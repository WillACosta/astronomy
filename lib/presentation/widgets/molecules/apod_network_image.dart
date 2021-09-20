import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

import '../../../external/dependency_injection/locator.dart';
import '../../../application/settings/settings_store.dart';
import '../../../domain/entities/media.dart';

class ApodNetworkImage extends StatelessWidget {
  const ApodNetworkImage({
    Key? key,
    required this.media,
  }) : super(key: key);

  final Media media;
  static final _settingsStore = locator<SettingsStore>();

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl:
          _settingsStore.userPreferences.useHdImages ? media.hdurl! : media.url,
      fit: BoxFit.cover,
    );
  }
}
