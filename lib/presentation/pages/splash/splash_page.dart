import 'package:flutter/material.dart';

import '../../utils/utils.dart';
import 'components/body.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppSizeConfig().init(context);

    return const Scaffold(
      body: Body(),
    );
  }
}
