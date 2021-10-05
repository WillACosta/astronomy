import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/utils.dart';

class OutlinedActionButton extends StatelessWidget {
  const OutlinedActionButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.isDark,
  }) : super(key: key);

  final void Function()? onPressed;
  final Widget child;
  final bool? isDark;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        primary: isDark != null && isDark == true
            ? AppColors.primary
            : AppColors.secondary,
        side: BorderSide(
          color: isDark != null && isDark == true
              ? AppColors.primary
              : AppColors.secondary,
          width: 1,
        ),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
