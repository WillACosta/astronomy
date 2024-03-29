import 'package:flutter/material.dart';

import 'package:astronomy/domain/entities/media.dart';
import 'package:astronomy/presentation/widgets/widgets.dart';

class ImageView extends StatelessWidget {
  const ImageView({Key? key, required this.media}) : super(key: key);

  final Media media;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
      ),
      body: Center(child: ApodNetworkImage(media: media)),
    );
  }
}
