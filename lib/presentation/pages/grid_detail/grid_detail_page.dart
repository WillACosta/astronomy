import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'components/grid_scrollable_sheet.dart';
import 'components/media_header.dart';

import '../../../domain/entities/media.dart';
import '../../utils/utils.dart';
import '../../widgets/widgets.dart';

class GridDetailPage extends StatelessWidget {
  const GridDetailPage({Key? key, required this.media}) : super(key: key);
  final Media media;

  @override
  Widget build(BuildContext context) {
    AppSizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        actions: [MediaActionBar()],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          MediaHeader(media: media),
          Padding(
            padding: EdgeInsets.only(top: getProportionateScreenHeight(80)),
            child: CachedNetworkImage(imageUrl: media.url, fit: BoxFit.cover),
          ),
          GridScrollableSheet(media: media),
        ],
      ),
    );
  }
}
