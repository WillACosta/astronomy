import 'package:flutter/material.dart';

import '../../../widgets/widgets.dart';

class ShimmerLoader extends StatelessWidget {
  const ShimmerLoader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
      ),
      itemCount: 10,
      itemBuilder: (_, int index) {
        return ShimmerTile.radiusSquare(
          width: 200,
          height: 200,
          shapeBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        );
      },
    );
  }
}