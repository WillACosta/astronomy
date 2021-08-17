import 'package:astronomy/presentation/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../application/home/home_state.dart';
import '../../../application/home/home_store.dart';
import '../../../external/dependency_injection/locator.dart';
import '../../widgets/widgets.dart';

import '../../utils/utils.dart' show AppSizeConfig, MenuState;
import 'components/bottom_sheet_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _store = locator<HomeStore>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _store.getMedia();
  }

  @override
  Widget build(BuildContext context) {
    AppSizeConfig().init(context);

    return Scaffold(
      extendBody: true,
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
      bottomNavigationBar: BottomNavigation(selectedMenu: MenuState.home),
    );
  }
}
