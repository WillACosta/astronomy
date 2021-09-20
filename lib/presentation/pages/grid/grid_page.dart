import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';

import '../../utils/utils.dart' show AppTextStyles;
import '../../widgets/widgets.dart' show ErrorStateWidget;

import '../../../external/dependency_injection/locator.dart';
import '../../../application/grid/grid_page_state.dart';
import '../../../application/grid/grid_page_store.dart';

import 'components/grid_page_body.dart';
import 'components/shimmer_loader.dart';

class GridPage extends StatelessWidget {
  GridPage({Key? key}) : super(key: key);

  final _store = locator<GridPageStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Theme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Observer(
          builder: (_) {
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
            icon: const Icon(Icons.calendar_today),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => _store.getMediaList(),
        child: Observer(
          builder: (_) {
            var state = _store.state;

            if (state is LoadingState) {
              return const ShimmerLoader();
            }

            if (state is SuccessState) {
              return GridPageBody(list: state.mediaList);
            }

            if (state is ErrorState) {
              return const ErrorStateWidget();
            }

            return const ErrorStateWidget();
          },
        ),
      ),
    );
  }
}
