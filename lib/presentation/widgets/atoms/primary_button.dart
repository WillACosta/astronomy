import 'package:flutter/material.dart';

import 'package:astronomy/presentation/utils/utils.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: AppTextStyles.head(),
          ),
          Padding(
            padding: EdgeInsets.only(left: getProportionateScreenWidth(10)),
            child: const Icon(Icons.arrow_forward),
          ),
        ],
      ),
    );
  }
}
