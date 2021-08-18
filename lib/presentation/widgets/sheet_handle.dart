import 'package:flutter/material.dart';

class SheetHandle extends StatelessWidget {
  const SheetHandle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return FractionallySizedBox(
      widthFactor: 0.25,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 12.0),
        child: Container(
          height: 5.0,
          decoration: BoxDecoration(
            color: theme.dividerColor,
            borderRadius: BorderRadius.circular(2.5),
          ),
        ),
      ),
    );
  }
}
