import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../../../widgets/widgets.dart';

class PlatformDatePickerButton
    extends PlatformWidget<CupertinoButton, IconButton> {
  final void Function()? onPressed;
  final GlobalKey stepKey;

  const PlatformDatePickerButton({
    Key? key,
    this.onPressed,
    required this.stepKey,
  }) : super(key: key);

  @override
  IconButton createAndroidWidget(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      color: Theme.of(context).colorScheme.secondary,
      icon: ApodShowcase(
        description: 'Select a range to view on the grid',
        showcaseKey: stepKey,
        disposeOnTap: false,
        child: const Icon(
          FeatherIcons.calendar,
          semanticLabel: 'Calendar button',
        ),
      ),
    );
  }

  @override
  CupertinoButton createIosWidget(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      padding: const EdgeInsets.all(0),
      child: ApodShowcase(
        description: 'Select a range to view on the grid',
        showcaseKey: stepKey,
        disposeOnTap: false,
        child: Icon(
          FeatherIcons.calendar,
          color: Theme.of(context).colorScheme.secondary,
          semanticLabel: 'Calendar button',
        ),
      ),
    );
  }
}
