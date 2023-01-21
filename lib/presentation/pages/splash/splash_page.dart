import 'package:flutter/material.dart';

import 'package:astronomy/presentation/utils/utils.dart';
import 'package:astronomy/presentation/pages/splash/components/body.dart';

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
