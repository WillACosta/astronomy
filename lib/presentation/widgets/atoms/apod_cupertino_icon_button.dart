import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ApodCupertinoIconButton extends StatelessWidget {
  const ApodCupertinoIconButton({
    Key? key,
    required this.icon,
    this.onPressed,
  }) : super(key: key);

  final IconData icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      child: Icon(
        icon,
        color: Theme.of(context).accentColor,
      ),
      onPressed: onPressed,
    );
  }
}
