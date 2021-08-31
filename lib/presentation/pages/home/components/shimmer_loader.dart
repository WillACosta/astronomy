import 'package:flutter/material.dart';

import '../../../widgets/widgets.dart';

class ShimmerLoader extends StatelessWidget {
  const ShimmerLoader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShimmerTile.radiusSquare(
      width: double.infinity,
      height: double.infinity,
      shapeBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
