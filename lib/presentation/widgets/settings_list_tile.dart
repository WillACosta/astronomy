import 'package:flutter/material.dart';

import '../utils/utils.dart';

class SettingsListTile extends StatelessWidget {
  const SettingsListTile({
    Key? key,
    required this.label,
    this.onTap,
  }) : super(key: key);

  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      tileColor: Theme.of(context).primaryColor,
      onTap: () {},
      title: Text(
        label,
        style: AppTextStyles.body(),
      ),
      dense: true,
    );
  }
}
