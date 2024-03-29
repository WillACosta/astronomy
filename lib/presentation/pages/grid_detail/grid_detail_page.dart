import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';

import 'package:astronomy/external/dependency_injection/locator.dart';
import 'package:astronomy/application/showcase/showcase_store.dart';
import 'package:astronomy/domain/entities/media.dart';
import 'package:astronomy/presentation/routes/route_navigator.dart';
import 'package:astronomy/presentation/widgets/widgets.dart';
import 'package:astronomy/presentation/utils/utils.dart';

import 'package:astronomy/presentation/pages/grid_detail/components/grid_scrollable_sheet.dart';
import 'package:astronomy/presentation/pages/grid_detail/components/media_header.dart';

class GridDetailPage extends StatefulWidget {
  const GridDetailPage({Key? key, required this.media}) : super(key: key);
  final Media media;

  @override
  _GridDetailPageState createState() => _GridDetailPageState();
}

class _GridDetailPageState extends State<GridDetailPage> {
  final _showcaseStore = serviceLocator<ShowCaseStore>();

  final _bottomSheetKey = GlobalKey();

  BuildContext? showCaseContext;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        Future.delayed(
          const Duration(milliseconds: 400),
          () {
            if (_showcaseStore.displayGridDetailShowcase) {
              ShowCaseWidget.of(showCaseContext!)
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

        _showcaseStore.closeShowCase(showcasePage: ShowcasePage.gridDetail);
      },
      builder: Builder(
        builder: (context) {
          showCaseContext = context;

          return PlatformScaffold(
            automaticallyImplyLeading: true,
            actionWidget: MediaActionBar(
              media: widget.media,
              isDetailScreen: true,
            ),
            body: Stack(
              fit: StackFit.expand,
              children: [
                MediaHeader(media: widget.media),
                Padding(
                  padding: EdgeInsets.only(
                    top: getProportionateScreenHeight(70),
                  ),
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
