import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';

import 'package:astronomy/presentation/utils/utils.dart';

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
      targetShapeBorder: const CircleBorder(),
      overlayOpacity: 0.8,
      overlayColor: AppColors.primary,
      descTextStyle: AppTextStyles.body(color: AppColors.primary),
      tooltipBackgroundColor: AppColors.secondary,
      targetPadding: const EdgeInsets.all(7.5),
      tooltipPadding: const EdgeInsets.all(10),
      disposeOnTap: disposeOnTap,
      showArrow: showArrow,
      onToolTipClick: onToolTipClick,
      onTargetClick: () {},
      child: child,
    );
  }
}
