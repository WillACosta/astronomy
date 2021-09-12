import 'package:flutter/material.dart';

import '../../utils/utils.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppTextStyles.head(),
    );
  }
}
