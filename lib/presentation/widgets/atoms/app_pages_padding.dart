import 'package:flutter/material.dart';

import 'package:astronomy/presentation/utils/app_size_config.dart';

class AppPagesPadding extends StatelessWidget {
  const AppPagesPadding({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenHeight(25),
        horizontal: getProportionateScreenWidth(15),
      ),
      child: child,
    );
  }
}
