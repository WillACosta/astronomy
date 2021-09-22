import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';

import '../../utils/utils.dart';

class ApodShowcase extends StatelessWidget {
  const ApodShowcase({
    Key? key,
    required this.showcaseKey,
    required this.description,
    required this.child,
    this.onToolTipClick,
    this.showArrow = true,
    this.disposeOnTap = true,
  }) : super(key: key);

  final GlobalKey showcaseKey;
  final String description;
  final Widget child;
  final void Function()? onToolTipClick;
  final bool showArrow;
  final bool disposeOnTap;

  @override
  Widget build(BuildContext context) {
    return Showcase(
      key: showcaseKey,
      description: description,
      shapeBorder: const CircleBorder(),
      overlayOpacity: 0.8,
      overlayColor: AppColors.primary,
      descTextStyle: AppTextStyles.body(color: AppColors.primary),
      showcaseBackgroundColor: AppColors.secondary,
      overlayPadding: const EdgeInsets.all(8),
      contentPadding: const EdgeInsets.all(10),
      disposeOnTap: disposeOnTap,
      showArrow: showArrow,
      onToolTipClick: onToolTipClick,
      onTargetClick: () {},
      child: child,
    );
  }
}
