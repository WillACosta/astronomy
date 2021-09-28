import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';

import '../../../application/container_page/container_page_store.dart';
import '../../../external/dependency_injection/locator.dart';
import '../../../application/showcase/showcase_store.dart';
import '../../../domain/entities/media.dart';
import '../../routes/route_navigator.dart';
import '../../widgets/widgets.dart';
import '../../utils/utils.dart';

import 'components/grid_scrollable_sheet.dart';
import 'components/media_header.dart';

class GridDetailPage extends StatefulWidget {
  const GridDetailPage({Key? key, required this.media}) : super(key: key);
  final Media media;

  @override
  _GridDetailPageState createState() => _GridDetailPageState();
}

class _GridDetailPageState extends State<GridDetailPage> {
  final _showcaseStore = locator<ShowCaseStore>();
  final _containerStore = locator<ContainerPageStore>();

  final _bottomSheetKey = GlobalKey();

  BuildContext? showCaseContext;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback(
      (_) {
        Future.delayed(
          const Duration(milliseconds: 400),
          () {
            if (_showcaseStore.displayGridDetailShowcase) {
              ShowCaseWidget.of(showCaseContext!)!
                  .startShowCase([_bottomSheetKey]);
            }
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    AppSizeConfig().init(context);

    return ShowCaseWidget(
      onComplete: (__, _) {
        closeRoute(context);

        _showcaseStore.closeShowCase(
          showcasePage: ShowcasePage.gridDetail,
        );

        _containerStore.toPage(0);
      },
      builder: Builder(
        builder: (context) {
          showCaseContext = context;

          return Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).primaryColor,
              elevation: 0,
              actions: [
                MediaActionBar(
                  media: widget.media,
                  isDetailScreen: true,
                )
              ],
            ),
            body: Stack(
              fit: StackFit.expand,
              children: [
                MediaHeader(media: widget.media),
                Padding(
                  padding:
                      EdgeInsets.only(top: getProportionateScreenHeight(80)),
                  child: widget.media.mediaType == 'image'
                      ? ApodNetworkImage(media: widget.media)
                      : const VideoMediaView(showLabel: true),
                ),
                GridScrollableSheet(
                  media: widget.media,
                  showcaseKey: _bottomSheetKey,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
