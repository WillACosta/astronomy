import 'package:flutter/material.dart';

import '../../../../domain/entities/media.dart';
import '../../../widgets/widgets.dart' show SheetContainer, SheetHandle;

import '../../../utils/utils.dart'
    show
        AppTextStyles,
        getProportionateScreenHeight,
        getProportionateScreenWidth;

class GridScrollableSheet extends StatelessWidget {
  const GridScrollableSheet({
    Key? key,
    required this.media,
  }) : super(key: key);
  final Media media;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.1,
      minChildSize: 0.1,
      maxChildSize: 0.6,
      builder: (_, ScrollController sController) {
        return SheetContainer(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: getProportionateScreenHeight(20),
              horizontal: getProportionateScreenWidth(25),
            ),
            child: ListView(
              controller: sController,
              children: [
                SheetHandle(),
                SizedBox(
                  height: getProportionateScreenHeight(25),
                ),
                Text(
                  media.explanation,
                  style: AppTextStyles.body,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
