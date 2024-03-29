import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:astronomy/presentation/widgets/molecules/platform_widget.dart';

class NativeProgressIndicator extends PlatformWidget<CupertinoActivityIndicator,
    CircularProgressIndicator> {
  const NativeProgressIndicator({Key? key, this.cupertinoRadius = 10})
      : super(key: key);

  final double cupertinoRadius;

  @override
  CircularProgressIndicator createAndroidWidget(BuildContext context) {
    return CircularProgressIndicator(
      strokeWidth: 1,
      color: Theme.of(context).colorScheme.secondary,
      semanticsLabel: 'Circular progress indicator',
    );
  }

  @override
  CupertinoActivityIndicator createIosWidget(BuildContext context) {
    return CupertinoActivityIndicator(radius: cupertinoRadius);
  }
}
