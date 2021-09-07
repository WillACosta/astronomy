import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:intl/intl.dart';

import '../../../../external/dependency_injection/locator.dart';
import '../../../../application/settings/settings_store.dart';
import '../../../../domain/entities/media.dart';
import '../../../routes/route_navigator.dart';
import '../../../widgets/widgets.dart';
import '../../../utils/utils.dart';

class GridPageBody extends StatelessWidget {
  GridPageBody({Key? key, required this.list}) : super(key: key);
  final List<Media> list;
  final dateFormat = DateFormat('dd/MM/yyyy');

  static final _settingsStore = locator<SettingsStore>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
        ),
        itemCount: list.length,
        itemBuilder: (_, int index) {
          return InkWell(
            borderRadius: BorderRadius.circular(30),
            onTap: () => navigateTo(
              context,
              routeName: AppRoutes.gridDetail,
              args: list[index],
            ),
            child: GridTile(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  list[index].mediaType == 'image'
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: CachedNetworkImage(
                            imageUrl: _settingsStore.userPreferences.useHdImages
                                ? list[index].hdurl!
                                : list[index].url,
                            fit: BoxFit.cover,
                          ),
                        )
                      : VideoMediaView(),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      color: Colors.black.withOpacity(0.3),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              list[index].title,
                              style: AppTextStyles.bodySmall(fontSize: 12),
                            ),
                            Text(
                              dateFormat.format(list[index].date),
                              style: AppTextStyles.bodySmallest(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
