import 'package:flutter/material.dart';

void navigateTo(BuildContext context, String routeName) {
  Navigator.of(context).pushNamed(routeName);
}

void closeRoute(BuildContext context) {
  Navigator.of(context).pop();
}
