import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../application/localization/localization_store.dart';
import '../../../../external/dependency_injection/locator.dart';
import '../../../../domain/entities/media.dart';
import '../../../utils/utils.dart';

class MediaTextContent extends StatefulWidget {
  const MediaTextContent({
    Key? key,
    required this.dateFormat,
    required this.media,
  }) : super(key: key);

  final DateFormat dateFormat;
  final Media media;

  @override
  _MediaTextContentState createState() => _MediaTextContentState();
}

class _MediaTextContentState extends State<MediaTextContent> {
  final localizationStore = locator<LocalizationStore>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // localizationStore.translate(widget.media.title);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
      child: Column(
        children: [
          Text(
            widget.dateFormat.format(widget.media.date),
            style: AppTextStyles.bodySmall(color: AppColors.accent),
          ),
          SizedBox(height: getProportionateScreenHeight(10)),
          Text(
            widget.media.title,
            style: AppTextStyles.bodyHead(),
          ),
          SizedBox(height: getProportionateScreenHeight(25)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.media.explanation,
                style: AppTextStyles.body(),
              ),
              SizedBox(height: getProportionateScreenHeight(25)),
              widget.media.copyright != null
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Copyright',
                          style: AppTextStyles.bodyHead(),
                        ),
                        SizedBox(height: getProportionateScreenHeight(10)),
                        Text(
                          widget.media.copyright!,
                          style: AppTextStyles.body(),
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
