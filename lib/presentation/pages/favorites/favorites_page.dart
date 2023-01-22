import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../application/favorites/favorites_store.dart';
import '../../../external/dependency_injection/locator.dart';
import '../../../domain/models/media.dart';
import '../../widgets/widgets.dart';
import '../../utils/utils.dart';

import 'components/favorites_empty_state.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  static final _store = serviceLocator<FavoriteStore>();

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      title: AppBarTitle(title: AppLocalizations.of(context)!.favorites),
      body: AppPagesPadding(
        child: ValueListenableBuilder(
          valueListenable: _store.favoritesBox.listenable(),
          builder: (_, Box box, child) {
            var mediaList = List<Media>.from(box.values);
            return mediaList.isEmpty
                ? const FavoritesEmptyState()
                : GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: getProportionateScreenHeight(10),
                      crossAxisSpacing: getProportionateScreenHeight(10),
                    ),
                    itemCount: mediaList.length,
                    itemBuilder: (_, int index) {
                      return GridItemInkWell(
                        media: mediaList[index],
                        children: [
                          Positioned(
                            top: 5,
                            right: 0,
                            child: IconButton(
                              onPressed: () => _store.toggleFavorite(
                                item: mediaList[index],
                              ),
                              icon: const Icon(Icons.bookmark),
                            ),
                          ),
                        ],
                      );
                    },
                  );
          },
        ),
      ),
    );
  }
}
