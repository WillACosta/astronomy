import 'package:flutter/material.dart';

import '../utils/utils.dart';

class SheetContainer extends StatelessWidget {
  const SheetContainer({ Key? key, required this.child }) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: child,
    );
  }
}