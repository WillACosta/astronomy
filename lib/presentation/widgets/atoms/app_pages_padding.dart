import 'package:flutter/material.dart';

import '../../utils/app_size_config.dart';

class AppPagesPadding extends StatelessWidget {
  const AppPagesPadding({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenHeight(30),
        horizontal: getProportionateScreenWidth(20),
      ),
      child: child,
    );
  }
}
