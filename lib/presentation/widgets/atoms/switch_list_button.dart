import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/utils.dart';
import '../widgets.dart';

class PlatformSwitchListButton extends PlatformWidget<Widget, Widget> {
  const PlatformSwitchListButton({
    Key? key,
    required this.label,
    required this.value,
    this.onChanged,
  }) : super(key: key);

  final String label;
  final bool value;
  final Function(bool)? onChanged;

  @override
  Widget createIosWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: AppTextStyles.body(),
          ),
          CupertinoSwitch(
            value: value,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }

  @override
  Widget createAndroidWidget(BuildContext context) {
    return SwitchListTile(
      value: value,
      contentPadding: const EdgeInsets.all(0),
      onChanged: onChanged,
      title: Text(
        label,
        style: AppTextStyles.body(),
      ),
    );
  }
}
