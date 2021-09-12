import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../application/favorites/favorites_store.dart';
import '../../../external/dependency_injection/locator.dart';
import '../../../application/settings/settings_store.dart';
import '../../../domain/entities/media.dart';
import '../../routes/route_navigator.dart';
import '../../widgets/widgets.dart';
import '../../utils/utils.dart';

import 'components/favorites_empty_state.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  static final _store = locator<FavoriteStore>();
  static final _settingsStore = locator<SettingsStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).primaryColor,
        title: AppBarTitle(title: AppLocalizations.of(context)!.favorites),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: ValueListenableBuilder(
          valueListenable: _store.favoritesBox.listenable(),
          builder: (_, Box box, child) {
            var mediaList = List<Media>.from(box.values);
            return mediaList.isEmpty
                ? FavoritesEmptyState()
                : GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 15,
                    ),
                    itemCount: mediaList.length,
                    itemBuilder: (_, int index) {
                      return InkWell(
                        borderRadius: BorderRadius.circular(30),
                        onTap: () => navigateTo(
                          context,
                          routeName: AppRoutes.gridDetail,
                          args: mediaList[index],
                        ),
                        child: GridTile(
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              mediaList[index].mediaType == 'image'
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(30),
                                      child: CachedNetworkImage(
                                        imageUrl: _settingsStore
                                                .userPreferences.useHdImages
                                            ? mediaList[index].hdurl!
                                            : mediaList[index].url,
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  : VideoMediaView(),
                              Positioned(
                                top: 5,
                                right: 0,
                                child: IconButton(
                                  onPressed: () => _store.toggleFavorite(
                                    item: mediaList[index],
                                  ),
                                  icon: Icon(Icons.bookmark),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
          },
        ),
      ),
    );
  }
}
