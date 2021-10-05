import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets.dart';

class PlatformScaffold extends PlatformWidget<Widget, Widget> {
  final Widget body;
  final Widget? title;
  final Widget? actionWidget;
  final bool isCupertinoMiddleTitle;
  final bool automaticallyImplyLeading;

  const PlatformScaffold({
    Key? key,
    required this.body,
    this.actionWidget,
    this.title,
    this.isCupertinoMiddleTitle = false,
    this.automaticallyImplyLeading = false,
  }) : super(key: key);

  @override
  Widget createAndroidWidget(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        automaticallyImplyLeading: automaticallyImplyLeading,
        backgroundColor: Theme.of(context).primaryColor,
        title: title,
        actions: actionWidget != null ? [actionWidget!] : null,
      ),
      body: body,
    );
  }

  @override
  Widget createIosWidget(BuildContext context) {
    // return CupertinoPageScaffold(
    //   navigationBar: isCupertinoMiddleTitle
    //       ? CupertinoNavigationBar(
    //           automaticallyImplyMiddle: false,
    //           automaticallyImplyLeading: false,
    //           border: null,
    //           backgroundColor: Theme.of(context).primaryColor,
    //           middle: title,
    //           trailing: actionWidget,
    //         )
    //       : CupertinoNavigationBar(
    //         padding: EdgeInsetsDirectional.zero,
    //         automaticallyImplyMiddle: true,
    //           automaticallyImplyLeading: automaticallyImplyLeading,
    //           border: null,
    //           backgroundColor: Theme.of(context).primaryColor,
    //           leading: title,
    //           trailing: actionWidget,
    //         ),
    //   child: body,
    // );
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        automaticallyImplyLeading: automaticallyImplyLeading,
        backgroundColor: Theme.of(context).primaryColor,
        title: title,
        actions: actionWidget != null ? [actionWidget!] : null,
      ),
      body: body,
    );
  }
}
