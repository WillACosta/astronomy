import 'package:flutter/material.dart';

import 'package:animations/animations.dart';

import '../../pages/grid_detail/grid_detail_page.dart';
import '../../../domain/entities/media.dart';

import '../widgets.dart' show ApodNetworkImage, VideoMediaView;

class GridItemInkWell extends StatelessWidget {
  const GridItemInkWell({
    Key? key,
    required this.media,
    required this.children,
  }) : super(key: key);

  final Media media;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      transitionDuration: const Duration(milliseconds: 400),
      closedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      closedColor: Theme.of(context).primaryColor,
      openColor: Theme.of(context).primaryColor,
      middleColor: Theme.of(context).primaryColor,
      openBuilder: (context, _) => GridDetailPage(media: media),
      closedBuilder: (context, VoidCallback openContainer) => GridTile(
        child: Stack(
          fit: StackFit.expand,
          children: [
            media.mediaType == 'image'
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: ApodNetworkImage(media: media),
                  )
                : const VideoMediaView(),
            ...children,
          ],
        ),
      ),
    );
  }
}
