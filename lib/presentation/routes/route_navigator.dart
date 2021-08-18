import 'package:flutter/material.dart';

void navigateTo(
  BuildContext context, {
  required String routeName,
  Object? args,
}) {
  if (args != null) {
    Navigator.of(context).pushNamed(routeName, arguments: args);
  } else {
    Navigator.of(context).pushNamed(routeName);
  }
}

void closeRoute(BuildContext context) {
  Navigator.of(context).pop();
}
