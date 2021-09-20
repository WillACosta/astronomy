import 'package:flutter/material.dart';

import '../../utils/utils.dart';
import 'error_state_widget.dart';

class ApodRefreshIndicator extends StatelessWidget {
  const ApodRefreshIndicator({
    Key? key,
    required this.onRefresh,
  }) : super(key: key);

  final Future<void> Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: ListView(
        children: [
          SizedBox(height: getProportionateScreenHeight(70)),
          const ErrorStateWidget(),
        ],
      ),
    );
  }
}
