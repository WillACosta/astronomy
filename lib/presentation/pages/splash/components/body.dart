import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../application/localization/localization_store.dart';
import '../../../../external/dependency_injection/locator.dart';
import '../../../routes/route_navigator.dart';
import '../../../widgets/widgets.dart';
import '../../../utils/utils.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  static final _localizationStore = locator<LocalizationStore>();

  @override
  void initState() {
    super.initState();

    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);

    Future.delayed(const Duration(seconds: 4)).then((_) {
      navigateTo(
        context,
        routeName: AppRoutes.container,
      );
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _localizationStore.locale = Localizations.localeOf(context);
  }

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
                const Spacer(),
                Text(
                  AppLocalizations.of(context)!.exploreTheUniverse,
                  style: AppTextStyles.headline(color: AppColors.secondary),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: getProportionateScreenHeight(15),
                ),
                const NativeProgressIndicator(cupertinoRadius: 15),
                const Spacer(),
                // GetStartedButton(),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: FractionalOffset.bottomRight,
        child: PrimaryButton(
          label: AppLocalizations.of(context)!.getStarted,
          onPressed: () => navigateTo(
            context,
            routeName: AppRoutes.container,
          ),
        ),
      ),
    );
  }
}
