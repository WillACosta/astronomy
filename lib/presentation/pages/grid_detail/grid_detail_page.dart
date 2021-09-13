import 'package:flutter/material.dart';

import '../../../domain/entities/media.dart';
import '../../widgets/widgets.dart';
import '../../utils/utils.dart';

import 'components/grid_scrollable_sheet.dart';
import 'components/media_header.dart';

class GridDetailPage extends StatelessWidget {
  const GridDetailPage({Key? key, required this.media}) : super(key: key);
  final Media media;

  @override
  Widget build(BuildContext context) {
    AppSizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        actions: [
          MediaActionBar(
            media: media,
            isDetailScreen: true,
          )
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          MediaHeader(media: media),
          Padding(
            padding: EdgeInsets.only(top: getProportionateScreenHeight(80)),
            child: media.mediaType == 'image'
                ? ApodNetworkImage(media: media)
                : VideoMediaView(showLabel: true),
          ),
          GridScrollableSheet(media: media),
        ],
      ),
    );
  }
}
