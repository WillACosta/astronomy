import 'package:flutter/material.dart';

import 'package:astronomy/presentation/routes/route_navigator.dart';

import '../../../../domain/entities/media.dart';
import '../../../widgets/widgets.dart';
import '../../../utils/exports.dart';

class GridPageBody extends StatelessWidget {
  const GridPageBody({
    Key? key,
    required this.list,
    required this.showcaseKey,
  }) : super(key: key);

  final List<Media> list;
  final GlobalKey showcaseKey;

  @override
  Widget build(BuildContext context) {
    return AppPagesPadding(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: getProportionateScreenHeight(10),
          crossAxisSpacing: getProportionateScreenHeight(10),
        ),
        itemCount: list.length,
        itemBuilder: (context, int index) {
          return index == 0
              ? ApodShowcase(
                  showcaseKey: showcaseKey,
                  description: 'View media details',
                  onToolTipClick: () => navigateTo(
                    context,
                    routeName: AppRoutes.gridDetail,
                    args: list[0],
                  ),
                  child: GridItem(
                    list: list,
                    itemIndex: 0,
                  ),
                )
              : GridItem(
                  list: list,
                  itemIndex: index,
                );
        },
      ),
    );
  }
}

class GridItem extends StatelessWidget {
  const GridItem({
    Key? key,
    required this.list,
    required this.itemIndex,
  }) : super(key: key);

  final List<Media> list;
  static final utils = Utils();
  final int itemIndex;

  @override
  Widget build(BuildContext context) {
    return GridItemInkWell(
      media: list[itemIndex],
      children: [
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
                    list[itemIndex].title,
                    style: AppTextStyles.bodySmall(fontSize: 12),
                  ),
                  Text(
                    utils.dateFormat.format(list[itemIndex].date),
                    style: AppTextStyles.bodySmallest(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
