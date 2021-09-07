import 'package:flutter/material.dart';

import '../utils/utils.dart' show AppColors, getProportionateScreenHeight;

class VideoMediaView extends StatelessWidget {
  const VideoMediaView({Key? key, this.showLabel}) : super(key: key);

  final bool? showLabel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Container(
          width: 55,
          height: 55,
          // color: AppColors.secondary,
          decoration: BoxDecoration(
            color: AppColors.secondary,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Icon(
              Icons.play_arrow,
              color: AppColors.primary,
              size: 35,
            ),
          ),
        ),
        SizedBox(height: getProportionateScreenHeight(10)),
        showLabel == true ? Text('This is a video') : Row(),
        Spacer(),
      ],
    );
  }
}
