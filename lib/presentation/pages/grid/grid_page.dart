import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:showcaseview/showcaseview.dart';

import '../../utils/utils.dart' show AppTextStyles;

import '../../../application/container_page/container_page_store.dart';
import '../../../external/dependency_injection/locator.dart';
import '../../../application/showcase/showcase_store.dart';
import '../../../application/grid/grid_page_state.dart';
import '../../../application/grid/grid_page_store.dart';
import '../../widgets/widgets.dart';

import 'components/grid_page_body.dart';
import 'components/shimmer_loader.dart';

class GridPage extends StatefulWidget {
  const GridPage({Key? key}) : super(key: key);

  @override
  _GridPageState createState() => _GridPageState();
}

class _GridPageState extends State<GridPage> {
  final _store = locator<GridPageStore>();
  final _showcaseStore = locator<ShowCaseStore>();
  final _containerStore = locator<ContainerPageStore>();

  final _calendarStepKey = GlobalKey();
  final _gridItemStepKey = GlobalKey();

  BuildContext? showCaseContext;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback(
      (_) {
        Future.delayed(
          const Duration(milliseconds: 400),
          () {
            if (_showcaseStore.displayShowCase) {
              ShowCaseWidget.of(showCaseContext!)!.startShowCase([
                _calendarStepKey,
                _gridItemStepKey,
              ]);
            }
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ShowCaseWidget(
      onFinish: () => _containerStore.toPage(0),
      builder: Builder(
        builder: (context) {
          showCaseContext = context;

          return Scaffold(
            extendBody: true,
            appBar: AppBar(
              centerTitle: false,
              backgroundColor: Theme.of(context).primaryColor,
              automaticallyImplyLeading: false,
              elevation: 0,
              title: Observer(
                builder: (context) {
                  return Text(
                    '${AppLocalizations.of(context)!.viewing} ${_store.getDateRangeLabel}',
                    style: AppTextStyles.body(),
                    textAlign: TextAlign.start,
                  );
                },
              ),
              actions: [
                IconButton(
                  onPressed: () async {
                    final dateRangeUser = await showDateRangePicker(
                      context: context,
                      firstDate: DateTime(1995, 6, 16),
                      lastDate: DateTime.now(),
                      initialDateRange: _store.getDateRange,
                    );

                    if (dateRangeUser == null) return;

                    _store.setDateRange(dateRangeUser);
                  },
                  icon: ApodShowcase(
                    description: 'Select an interval to show in grid view',
                    showcaseKey: _calendarStepKey,
                    disposeOnTap: false,
                    child: const Icon(Icons.calendar_today),
                  ),
                ),
              ],
            ),
            body: RefreshIndicator(
              onRefresh: () => _store.getMediaList(),
              child: Observer(
                builder: (context) {
                  var state = _store.state;

                  if (state is LoadingState) {
                    return const ShimmerLoader();
                  }

                  if (state is SuccessState) {
                    return GridPageBody(
                      list: state.mediaList,
                      showcaseKey: _gridItemStepKey,
                    );
                  }

                  return ApodRefreshIndicator(onRefresh: _store.getMediaList);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
