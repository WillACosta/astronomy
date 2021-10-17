import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:showcaseview/showcaseview.dart';

import '../../../application/container_page/container_page_store.dart';
import '../../../external/dependency_injection/locator.dart';
import '../../../application/showcase/showcase_store.dart';
import '../../../application/home/home_state.dart';
import '../../../application/home/home_store.dart';
import '../../widgets/widgets.dart';

import '../../utils/utils.dart';

import 'components/shimmer_loader.dart';
import 'components/show_sheet_modal.dart';
import 'components/bottom_sheet_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _key1 = GlobalKey();

  final _store = locator<HomeStore>();
  final _containerStore = locator<ContainerPageStore>();
  final _showcaseStore = locator<ShowCaseStore>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Future.delayed(
        const Duration(milliseconds: 800),
        () {
          if (_showcaseStore.displayHomeShowcase) {
            ShowCaseWidget.of(context)!.startShowCase([_key1]);
          }
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    AppSizeConfig().init(context);

    return Scaffold(
      body: Observer(
        builder: (context) {
          var state = _store.state;

          if (state is ErrorState) {
            return ApodErrorRefreshIndicator(onRefresh: _store.refresh);
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
                        ApodShowcase(
                          showcaseKey: _key1,
                          description:
                              'Swipe up on the screen or touch here to view details of media',
                          child: BottomSheetButton(media: state.media),
                          onToolTipClick: () => _containerStore.toPage(1),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }

          return Row();
        },
      ),
    );
  }
}
