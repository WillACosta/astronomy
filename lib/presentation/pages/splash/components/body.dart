import 'package:flutter/material.dart';

import '../../../widgets/primary_button.dart';
import '../../../routes/route_navigator.dart';
import '../../../utils/utils.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          AppImages.nasaSplashImage,
          fit: BoxFit.cover,
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.3),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20),
            ),
            child: Column(
              children: [
                Text(
                  'Astronomy',
                  style: AppTextStyles.logo,
                ),
                Spacer(),
                Text(
                  'Explore the \nuniverse',
                  style: AppTextStyles.headline,
                  textAlign: TextAlign.center,
                ),
                Expanded(
                  child: Align(
                    alignment: FractionalOffset.bottomRight,
                    child: PrimaryButton(
                      label: 'Get Started',
                      onPressed: () => navigateTo(
                        context,
                        routeName: AppRoutes.container,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
