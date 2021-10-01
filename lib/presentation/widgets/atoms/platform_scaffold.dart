import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets.dart';

class PlatformScaffold extends PlatformWidget<CupertinoPageScaffold, Scaffold> {
  final Widget body;
  final Widget? title;
  final Widget? actionWidget;
  final bool isCupertinoMiddleTitle;

  const PlatformScaffold({
    Key? key,
    required this.body,
    this.actionWidget,
    this.title,
    this.isCupertinoMiddleTitle = false,
  }) : super(key: key);

  @override
  Scaffold createAndroidWidget(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).primaryColor,
        title: title,
        actions: actionWidget != null ? [actionWidget!] : null,
      ),
      body: body,
    );
  }

  @override
  CupertinoPageScaffold createIosWidget(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: isCupertinoMiddleTitle
          ? CupertinoNavigationBar(
              automaticallyImplyMiddle: false,
              automaticallyImplyLeading: false,
              border: null,
              backgroundColor: Theme.of(context).primaryColor,
              middle: title,
              trailing: actionWidget,
            )
          : CupertinoNavigationBar(
              automaticallyImplyMiddle: false,
              automaticallyImplyLeading: false,
              border: null,
              backgroundColor: Theme.of(context).primaryColor,
              leading: title,
              trailing: actionWidget,
            ),
      child: body,
    );
  }
}
