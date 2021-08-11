import 'package:flutter/material.dart';

import '../../utils/utils.dart' show MenuState;
import '../../widgets/widgets.dart' show BottomNavigation;

class GridPage extends StatelessWidget {
  const GridPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
      bottomNavigationBar: BottomNavigation(selectedMenu: MenuState.grid),
    );
  }
}