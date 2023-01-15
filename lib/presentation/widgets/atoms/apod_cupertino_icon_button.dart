import 'package:astronomy/application/settings/settings_store.dart';
import 'package:astronomy/external/dependency_injection/locator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class ApodCupertinoIconButton extends StatelessWidget {
  const ApodCupertinoIconButton({
    Key? key,
    required this.icon,
    this.onPressed,
    required this.isDarkIcons,
  }) : super(key: key);

  final IconData icon;
  final void Function()? onPressed;
  final bool isDarkIcons;

  static final _settingsStore = serviceLocator<SettingsStore>();

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      child: Icon(
        icon,
        color:
            _settingsStore.userPreferences.useDarkMode == false && isDarkIcons
                ? AppColors.primary
                : AppColors.secondary,
      ),
      onPressed: onPressed,
    );
  }
}
