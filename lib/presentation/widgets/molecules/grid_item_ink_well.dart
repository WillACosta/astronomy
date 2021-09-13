import 'package:flutter/material.dart';

import '../../../domain/entities/media.dart';
import '../../routes/route_navigator.dart';
import '../../utils/utils.dart';

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
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: () => navigateTo(
        context,
        routeName: AppRoutes.gridDetail,
        args: media,
      ),
      child: GridTile(
        child: Stack(
          fit: StackFit.expand,
          children: [
            media.mediaType == 'image'
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: ApodNetworkImage(media: media),
                  )
                : VideoMediaView(),
            ...children,
          ],
        ),
      ),
    );
  }
}
