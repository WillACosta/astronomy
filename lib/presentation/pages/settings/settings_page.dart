import 'package:flutter/material.dart';

import '../../utils/utils.dart' show MenuState;
import '../../widgets/widgets.dart' show BottomNavigation, ErrorStateWidget;

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ErrorStateWidget(),
      bottomNavigationBar: BottomNavigation(selectedMenu: MenuState.settings),
    );
  }
}
