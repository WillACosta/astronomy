import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../external/dependency_injection/locator.dart';
import '../../../application/home/home_state.dart';
import '../../../application/home/home_store.dart';
import '../../widgets/widgets.dart';

import '../../utils/utils.dart' show AppSizeConfig;

import 'components/shimmer_loader.dart';
import 'components/show_sheet_modal.dart';
import 'components/bottom_sheet_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static final _store = locator<HomeStore>();

  @override
  Widget build(BuildContext context) {
    AppSizeConfig().init(context);

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 4));
        },
        child: Observer(
          builder: (_) {
            var state = _store.state;

            if (state is ErrorState) {
              return const ErrorStateWidget();
            }

            if (state is InitialState) {}

            if (state is LoadingState) {
              return const ShimmerLoader();
            }

            if (state is SuccessState) {
              return GestureDetector(
                onVerticalDragUpdate: (dragUpdateDetails) => showSheetModal(
                  context,
                  state.media,
                ),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    state.media.mediaType == 'image'
                        ? ApodNetworkImage(media: state.media)
                        : const VideoMediaView(showLabel: true),
                    SafeArea(
                      child: Column(
                        children: [
                          const Spacer(),
                          BottomSheetButton(media: state.media),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }

            return Container();
          },
        ),
      ),
    );
  }
}
