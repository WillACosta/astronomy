import 'package:flutter/material.dart';

import '../../../../domain/entities/media.dart';

import '../../../utils/exports.dart'
    show blurFilter, getProportionateScreenHeight, getProportionateScreenWidth;

import '../../../widgets/widgets.dart' show ApodMediaTitle;

class MediaHeader extends StatelessWidget {
  const MediaHeader({Key? key, required this.media}) : super(key: key);

  final Media media;

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: blurFilter,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
          vertical: getProportionateScreenHeight(20),
        ),
        child: ApodMediaTitle(media: media),
      ),
    );
  }
}
