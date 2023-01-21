import 'package:flutter/material.dart';

import 'package:astronomy/presentation/utils/utils.dart';

class SettingsListTile extends StatelessWidget {
  const SettingsListTile({
    Key? key,
    required this.label,
    this.onTap,
    this.semanticsLabel,
  }) : super(key: key);

  final String label;
  final VoidCallback? onTap;
  final String? semanticsLabel;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      tileColor: Theme.of(context).primaryColor,
      onTap: onTap,
      title: Text(
        label,
        style: AppTextStyles.body(),
        semanticsLabel: semanticsLabel,
      ),
      dense: true,
    );
  }
}
