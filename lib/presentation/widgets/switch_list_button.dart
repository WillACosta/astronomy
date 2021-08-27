import 'package:flutter/material.dart';

import '../utils/utils.dart';

class SwitchListButton extends StatelessWidget {
  const SwitchListButton({
    Key? key,
    required this.value,
    this.onChanged,
    required this.label,
  }) : super(key: key);

  final String label;
  final bool value;
  final Function(bool)? onChanged;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: value,
      contentPadding: EdgeInsets.all(0),
      onChanged: onChanged,
      title: Text(
        label,
        style: AppTextStyles.body(),
      ),
    );
  }
}
