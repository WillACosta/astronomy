import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../application/home/home_state.dart';
import '../../../application/home/home_store.dart';
import '../../../external/dependency_injection/locator.dart';
import '../../widgets/widgets.dart';
import '../../utils/utils.dart' show AppSizeConfig, AppImages;

import 'components/bottom_sheet_button.dart';

class HomePage extends StatelessWidget {
  final _store = locator<HomeStore>();

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
              return Center(child: CircularProgressIndicator());
            }

            if (state is SuccessState) {
              return Stack(
                fit: StackFit.expand,
                children: [
                  state.media.mediaType == 'image'
                      ? CachedNetworkImage(
                          imageUrl: state.media.url,
                          fit: BoxFit.cover,
                        )
                      : Image.asset(AppImages.videoIllustration),
                  SafeArea(
                    child: Column(
                      children: [
                        Spacer(),
                        BottomSheetButton(media: state.media),
                      ],
                    ),
                  ),
                ],
              );
            }

            return Container();
          },
        ),
      ),
    );
  }
}
