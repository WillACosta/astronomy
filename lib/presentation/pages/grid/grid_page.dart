import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../utils/utils.dart' show AppTextStyles, MenuState;
import '../../widgets/widgets.dart' show BottomNavigation;

import '../../../application/grid/grid_page_state.dart';
import '../../../external/dependency_injection/locator.dart';
import '../../../application/grid/grid_page_store.dart';

import 'components/grid_page_body.dart';

class GridPage extends StatelessWidget {
  GridPage({Key? key}) : super(key: key);

  final _store = locator<GridPageStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Observer(builder: (_) {
          return Text(
            _store.getDateRangeLabel,
            style: AppTextStyles.body,
          );
        }),
        actions: [
          IconButton(
            onPressed: () async {
              final dateRangeUser = await showDateRangePicker(
                context: context,
                firstDate: DateTime(DateTime.now().year - 5),
                lastDate: DateTime(DateTime.now().year + 5),
                initialDateRange: _store.getDateRange,
              );

              if (dateRangeUser == null) return;

              _store.setDateRange(dateRangeUser);
            },
            icon: Icon(
              Icons.calendar_today,
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 4));
        },
        child: Observer(
          builder: (_) {
            var state = _store.state;

            if (state is LoadingState) {
              return Center(child: CircularProgressIndicator());
            }

            if (state is SuccessState) {
              return GridPageBody(list: state.mediaList);
            }

            if (state is ErrorState) {
              return Center(
                child: Container(
                  child: Text(
                    'Ops! An error has occurred :(\nTry refresh the page.',
                    style: AppTextStyles.headline,
                  ),
                ),
              );
            }

            return Container();
          },
        ),
      ),
      bottomNavigationBar: BottomNavigation(selectedMenu: MenuState.grid),
    );
  }
}
