import 'package:flutter/material.dart';

import '../../utils/utils.dart';

class OutlinedActionButton extends StatelessWidget {
  const OutlinedActionButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.isDark,
    this.semanticLabel,
  }) : super(key: key);

  final void Function()? onPressed;
  final Widget child;
  final bool? isDark;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: semanticLabel,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          foregroundColor: isDark != null && isDark == true
              ? AppColors.primary
              : AppColors.secondary, side: BorderSide(
            color: isDark != null && isDark == true
                ? AppColors.primary
                : AppColors.secondary,
            width: 1,
          ),
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
