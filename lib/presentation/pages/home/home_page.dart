import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../external/dependency_injection/locator.dart';
import '../../../application/settings/settings_store.dart';
import '../../../application/home/home_state.dart';
import '../../../application/home/home_store.dart';
import '../../widgets/widgets.dart';

import '../../utils/utils.dart' show AppSizeConfig;

import 'components/shimmer_loader.dart';
import 'components/show_sheet_modal.dart';
import 'components/bottom_sheet_button.dart';

class HomePage extends StatelessWidget {
  static final _store = locator<HomeStore>();
  static final _settingsStore = locator<SettingsStore>();

  @override
  Widget build(BuildContext context) {
    AppSizeConfig().init(context);

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 4));
        },
        child: Observer(
          builder: (_) {
            var state = _store.state;

            if (state is ErrorState) {
              return ErrorStateWidget();
            }

            if (state is InitialState) {}

            if (state is LoadingState) {
              return ShimmerLoader();
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
                        ? CachedNetworkImage(
                            imageUrl: _settingsStore.userPreferences.useHdImages
                                ? state.media.hdurl!
                                : state.media.url,
                            fit: BoxFit.cover,
                          )
                        : VideoMediaView(showLabel: true),
                    SafeArea(
                      child: Column(
                        children: [
                          Spacer(),
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
