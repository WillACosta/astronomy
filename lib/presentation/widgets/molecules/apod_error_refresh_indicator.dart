import 'package:flutter/material.dart';

import 'package:astronomy/presentation/utils/utils.dart';
import 'package:astronomy/presentation/widgets/molecules/error_state_widget.dart';

class ApodErrorRefreshIndicator extends StatelessWidget {
  const ApodErrorRefreshIndicator({
    Key? key,
    required this.onRefresh,
    this.error,
  }) : super(key: key);

  final Future<void> Function() onRefresh;
  final String? error;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: ListView(
        children: [
          SizedBox(height: getProportionateScreenHeight(70)),
          const ErrorStateWidget(),
          error != null
              ? Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  child: Text(error!),
                )
              : Row(),
        ],
      ),
    );
  }
}
