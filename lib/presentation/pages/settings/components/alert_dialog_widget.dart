import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:astronomy/presentation/utils/utils.dart';

class AlertDialogWidget extends StatelessWidget {
  const AlertDialogWidget({
    Key? key,
    required this.title,
    required this.content,
    this.actions = const <Widget>[],
  }) : super(key: key);

  final String title;
  final String content;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: blurFilter,
      child: Platform.isIOS
          ? CupertinoAlertDialog(
              title: Text(
                title,
                semanticsLabel: 'About project title',
              ),
              content: Padding(
                padding: EdgeInsets.only(top: getProportionateScreenHeight(10)),
                child: Text(
                  content,
                  textAlign: TextAlign.left,
                  semanticsLabel: 'About project content text',
                ),
              ),
              actions: actions,
            )
          : AlertDialog(
              title: Text(
                title,
                semanticsLabel: 'About project title',
              ),
              content: Padding(
                padding: EdgeInsets.only(top: getProportionateScreenHeight(10)),
                child: Text(
                  content,
                  textAlign: TextAlign.left,
                  semanticsLabel: 'About project content text',
                ),
              ),
              actions: actions,
            ),
    );
  }
}
