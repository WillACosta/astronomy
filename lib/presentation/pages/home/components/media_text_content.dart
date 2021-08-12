import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../domain/entities/media.dart';
import '../../../utils/utils.dart';

class MediaTextContent extends StatelessWidget {
  const MediaTextContent({
    Key? key,
    required this.dateFormat,
    required this.media,
  }) : super(key: key);

  final DateFormat dateFormat;
  final Media media;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
      child: Column(
        children: [
          Text(
            dateFormat.format(media.date),
            style: AppTextStyles.bodySmall(color: AppColors.accent),
          ),
          SizedBox(height: getProportionateScreenHeight(10)),
          Text(
            media.title,
            style: AppTextStyles.bodyHead,
          ),
          SizedBox(height: getProportionateScreenHeight(25)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                media.explanation,
                style: AppTextStyles.body,
              ),
              SizedBox(height: getProportionateScreenHeight(25)),
              media.copyright != null
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Copyright',
                          style: AppTextStyles.bodyHead,
                        ),
                        SizedBox(height: getProportionateScreenHeight(10)),
                        Text(
                          media.copyright!,
                          style: AppTextStyles.body,
                        ),
                      ],
                    )
                  : Container(),
              SizedBox(height: getProportionateScreenHeight(10)),
            ],
          ),
        ],
      ),
    );
  }
}
