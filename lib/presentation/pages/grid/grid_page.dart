import 'package:flutter/material.dart';

import '../../utils/utils.dart' show AppTextStyles, MenuState;
import '../../widgets/widgets.dart' show BottomNavigation;

import 'components/grid_page_body.dart';

class GridPage extends StatelessWidget {
  const GridPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text(
          'Viewing 27/07/2021 - today',
          style: AppTextStyles.body,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.calendar_today,
            ),
          ),
        ],
      ),
      body: GridPageBody(),
      bottomNavigationBar: BottomNavigation(selectedMenu: MenuState.grid),
    );
  }
}
