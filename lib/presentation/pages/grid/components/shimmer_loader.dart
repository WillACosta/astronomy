import '../../../utils/utils.dart';
import 'package:flutter/material.dart';

import '../../../widgets/widgets.dart';

class ShimmerLoader extends StatelessWidget {
  const ShimmerLoader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppPagesPadding(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: getProportionateScreenWidth(10),
          crossAxisSpacing: getProportionateScreenHeight(10),
        ),
        itemCount: 10,
        itemBuilder: (_, int index) {
          return ShimmerTile.radiusSquare(
            width: getProportionateScreenWidth(160),
            height: getProportionateScreenHeight(160),
            shapeBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          );
        },
      ),
    );
  }
}
