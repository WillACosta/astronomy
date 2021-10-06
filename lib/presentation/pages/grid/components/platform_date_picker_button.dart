import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      color: Theme.of(context).accentColor,
      icon: ApodShowcase(
        description: 'Select a range to view on the grid',
        showcaseKey: stepKey,
        disposeOnTap: false,
        child: const Icon(Icons.calendar_today),
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
          CupertinoIcons.calendar,
          color: Theme.of(context).accentColor,
        ),
      ),
    );
  }
}
